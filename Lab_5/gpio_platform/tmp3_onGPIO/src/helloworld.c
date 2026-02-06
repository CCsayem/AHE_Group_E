#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xgpio.h"
#include "xparameters.h"
#include "sleep.h"

// --- Configuration ---
// Check xparameters.h if your ID is different (usually XPAR_AXI_GPIO_0_DEVICE_ID)
#define GPIO_DEVICE_ID  0x40000000

// Channel 1 = SCL, Channel 2 = SDA (Based on your Vivado settings)
#define SCL_CH 1
#define SDA_CH 2

// TCN75A I2C Address (0x48 is default for PmodTMP3 if jumpers are connected)
#define TMP3_ADDR 0x48

XGpio Gpio;

// --- Low-Level GPIO Helpers (Open Drain Logic) ---

// Drive Line LOW: Set Direction to Output (0), Data is already 0
void line_low(int channel) {
    XGpio_SetDataDirection(&Gpio, channel, 0x0); // Output
    XGpio_DiscreteWrite(&Gpio, channel, 0x0);    // Drive 0
}

// Release Line HIGH: Set Direction to Input (1), Pull-up resistor does the rest
void line_release(int channel) {
    XGpio_SetDataDirection(&Gpio, channel, 0x1); // Input
}

// Read the state of the SDA line
int sda_read() {
    return XGpio_DiscreteRead(&Gpio, SDA_CH);
}

// --- I2C Primitives ---

void i2c_delay() {
    usleep(5); // Adjust speed if necessary (TCN75A is slow, 5us is safe)
}

void i2c_start() {
    line_release(SDA_CH);
    line_release(SCL_CH);
    i2c_delay();
    line_low(SDA_CH); // SDA goes low first
    i2c_delay();
    line_low(SCL_CH); // Then SCL goes low
}

void i2c_stop() {
    line_low(SDA_CH);
    line_release(SCL_CH);
    i2c_delay();
    line_release(SDA_CH); // SDA goes high while SCL is high
    i2c_delay();
}

// Write 8 bits, return ACK (0 = ACK, 1 = NACK)
int i2c_write_byte(u8 byte) {
    int i;
    for(i = 7; i >= 0; i--) {
        // Set Data Bit
        if (byte & (1 << i)) line_release(SDA_CH);
        else                 line_low(SDA_CH);
        
        i2c_delay();
        line_release(SCL_CH); // Pulse Clock High
        i2c_delay();
        line_low(SCL_CH);     // Clock Low
    }
    
    // Read ACK/NACK
    line_release(SDA_CH);     // Release SDA so slave can control it
    i2c_delay();
    line_release(SCL_CH);     // Clock High
    i2c_delay();
    
    int ack = sda_read();     // Read Ack bit
    line_low(SCL_CH);         // Clock Low
    return ack;
}

// Read 8 bits
u8 i2c_read_byte(int send_ack) {
    int i;
    u8 byte = 0;
    
    line_release(SDA_CH); // Make sure we are in input mode
    
    for(i = 7; i >= 0; i--) {
        i2c_delay();
        line_release(SCL_CH); // Clock High
        i2c_delay();
        
        if(sda_read()) byte |= (1 << i); // Sample data
        
        line_low(SCL_CH);     // Clock Low
    }
    
    // Send ACK or NACK
    if(send_ack) line_low(SDA_CH); // ACK (Drive Low)
    else         line_release(SDA_CH); // NACK (Leave High)
    
    i2c_delay();
    line_release(SCL_CH); // Clock High
    i2c_delay();
    line_low(SCL_CH);     // Clock Low
    line_release(SDA_CH); // Release line
    
    return byte;
}

// --- Main Application ---

int main() {
    init_platform();
    xil_printf("Pmod TMP3 I2C Test Started\n\r");

    // Initialize GPIO
    int status = XGpio_Initialize(&Gpio, GPIO_DEVICE_ID);
    if (status != XST_SUCCESS) {
        xil_printf("GPIO Init Failed\r\n");
        return XST_FAILURE;
    }

    while(1) {
        // 1. Start Condition
        i2c_start();
        
        // 2. Send Address + READ bit (Address 0x48 << 1 | 1 = 0x91)
        if(i2c_write_byte((TMP3_ADDR << 1) | 1) != 0) {
            xil_printf("Sensor not found (No ACK)\r\n");
            i2c_stop();
            sleep(1);
            continue;
        }

        // 3. Read MSB (Temperature Integer part)
        u8 msb = i2c_read_byte(1); // Send ACK
        
        // 4. Read LSB (Fractional part)
        u8 lsb = i2c_read_byte(0); // Send NACK (End of transmission)
        
        // 5. Stop Condition
        i2c_stop();

        // 6. Convert Data
        // Data is 16-bit left aligned. 
        // 12-bit resolution: Top 8 bits = MSB, Top 4 bits of LSB = fractional
        int raw_temp = (msb << 8) | lsb;
        raw_temp >>= 4; // Shift right to get 12-bit integer value
        
        // Multiply by resolution (0.0625 degrees C per bit)
        float temperature = raw_temp * 0.0625;

        // Print result (Note: xil_printf doesn't support %f by default)
        // We print integer and decimal parts separately
        int temp_int = (int)temperature;
        int temp_frac = (int)((temperature - temp_int) * 10000);
        
        xil_printf("Temperature: %d.%04d C\r\n", temp_int, temp_frac);

        sleep(1);
    }

    cleanup_platform();
    return 0;
}