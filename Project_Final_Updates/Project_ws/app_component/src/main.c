#include "xparameters.h"
#include "xil_cache.h"
#include "xil_printf.h"
#include "xil_io.h"
#include "sleep.h"
#include "xiic_l.h"
#include "PmodOLEDrgb.h"
#include <stdio.h>
#include <string.h>
#include <stdbool.h>

// ==========================================================
// 1. HARDWARE ADDRESSES (MATCHING YOUR FINAL HARDWARE)
// ==========================================================
// Temp Sensor
#define IIC_BASE_ADDRESS    0x40800000
#define ADT7420_ADDR        0x4B
#define ADT7420_TEMP_REG    0x00

// ESP32 Pmod (Port JC)
#define ESP32_GPIO_BASE     0x44A00000
#define ESP32_UART_BASE     0x44A10000

// OLED Pmod (Port JB) - Note: These must not overlap with ESP32
#define OLED_GPIO_BASE      0x44A20000
#define OLED_SPI_BASE       0x44A30000

// UART Registers
#define UART_RX_FIFO        0x0
#define UART_TX_FIFO        0x4
#define UART_STAT_REG       0x8
#define STS_RX_VALID        0x01
#define STS_TX_FULL         0x08

// ==========================================================
// 2. CONFIGURATION & CREDENTIALS
// ==========================================================
#define TEMP_THRESHOLD      20 // Overheating limit

#define SSID                "Pixel"
#define PASS                "12345678a"
#define AIO_USERNAME        "RK_Saleh"
#define AIO_KEY             "aio_CsPx12si8K7h1OZ5B9NjLaEOArXG"
#define FEED_KEY            "ahe-project"

// ==========================================================
// 3. GLOBAL OBJECTS
// ==========================================================
PmodOLEDrgb oledDevice;
u16 COLOR_RED, COLOR_GREEN, COLOR_WHITE, COLOR_BLACK;

// ==========================================================
// 4. HELPER FUNCTIONS (UTILITIES)
// ==========================================================

// --- Helper: Convert Integer to String ---
void light_int_to_str(int n, char* buffer) {
    int i = 0, isNeg = 0;
    if (n < 0) { isNeg = 1; n = -n; }
    if (n == 0) { buffer[i++] = '0'; }
    else {
        while (n != 0) { buffer[i++] = (n % 10) + '0'; n /= 10; }
    }
    if (isNeg) buffer[i++] = '-';
    buffer[i] = '\0';
    for (int j = 0, k = i - 1; j < k; j++, k--) {
        char temp = buffer[j]; buffer[j] = buffer[k]; buffer[k] = temp;
    }
}

// --- Helper: Setup OLED Colors ---
void SetupColors() {
    COLOR_RED   = OLEDrgb_BuildRGB(255, 0, 0);
    COLOR_GREEN = OLEDrgb_BuildRGB(0, 255, 0);
    COLOR_WHITE = OLEDrgb_BuildRGB(255, 255, 255);
    COLOR_BLACK = OLEDrgb_BuildRGB(0, 0, 0);
}

// ==========================================================
// 5. ESP32 DRIVER FUNCTIONS
// ==========================================================
int Esp32_IsRxEmpty() {
    return !(Xil_In32(ESP32_UART_BASE + UART_STAT_REG) & STS_RX_VALID);
}

u8 Esp32_ReadByte() {
    return (u8)Xil_In32(ESP32_UART_BASE + UART_RX_FIFO);
}

void Esp32_WriteByte(u8 data) {
    while ((Xil_In32(ESP32_UART_BASE + UART_STAT_REG) & STS_TX_FULL));
    Xil_Out32(ESP32_UART_BASE + UART_TX_FIFO, data);
}

void Esp32_Print(const char *str) {
    while (*str) Esp32_WriteByte(*str++);
}

void Esp32_ClearBuffer() {
    while (!Esp32_IsRxEmpty()) Esp32_ReadByte();
}

// Smart Delay: Waits while processing incoming UART data
void smart_delay_ms(int ms) {
    for (int i = 0; i < ms; i += 10) {
        usleep(10000); // 10ms
        while (!Esp32_IsRxEmpty()) {
            xil_printf("%c", Esp32_ReadByte()); // Echo to debug terminal
        }
    }
}

void send_at_cmd(const char *cmd, int wait_ms) {
    xil_printf("CMD: %s", cmd);
    Esp32_Print(cmd);
    smart_delay_ms(wait_ms);
    xil_printf("\r\n");
}

void reset_esp32() {
    xil_printf("--- Resetting ESP32 ---\r\n");
    Xil_Out32(ESP32_GPIO_BASE, 0x0); // Reset Low
    usleep(100000);
    Xil_Out32(ESP32_GPIO_BASE, 0x1); // Release High
    sleep(3);
    Esp32_ClearBuffer();
}

void connect_wifi() {
    xil_printf("\r\n--- Connecting to WiFi ---\r\n");
    send_at_cmd("AT+RESTORE\r\n", 2000);
    send_at_cmd("AT+CWMODE=1\r\n", 500);
    send_at_cmd("AT+CWQAP\r\n", 500);

    Esp32_Print("AT+CWJAP=\"");
    Esp32_Print(SSID);
    Esp32_Print("\",\"");
    Esp32_Print(PASS);
    Esp32_Print("\"\r\n");
    
    xil_printf("Waiting for connection (10s)...\r\n");
    smart_delay_ms(10000);
}

// Function to send Float value (Temperature) to Adafruit
void send_temp_to_adafruit(float temp_val) {
    char val_str[16], len_str[12], cmd_len_str[32];
    
    // Format float to string manually "XX.XX"
    int t_int = (int)temp_val;
    int t_frac = (int)((temp_val - t_int) * 100);
    if(t_frac < 0) t_frac = -t_frac;
    
    // Create the JSON value string manually
    char int_part[8], frac_part[8];
    light_int_to_str(t_int, int_part);
    light_int_to_str(t_frac, frac_part);
    
    // Combine: "24.50"
    strcpy(val_str, int_part);
    strcat(val_str, ".");
    if(t_frac < 10) strcat(val_str, "0"); // padding
    strcat(val_str, frac_part);

    // Calculate Lengths
    int payload_len = 12 + strlen(val_str); // {"value":"..."}
    
    // Construct Packet
    char packet[512]; packet[0] = '\0';
    strcat(packet, "POST /api/v2/");
    strcat(packet, AIO_USERNAME);
    strcat(packet, "/feeds/");
    strcat(packet, FEED_KEY);
    strcat(packet, "/data HTTP/1.1\r\n");
    strcat(packet, "Host: io.adafruit.com\r\n");
    strcat(packet, "X-AIO-Key: ");
    strcat(packet, AIO_KEY);
    strcat(packet, "\r\n");
    strcat(packet, "Content-Type: application/json\r\n");
    strcat(packet, "Content-Length: ");
    light_int_to_str(payload_len, len_str);
    strcat(packet, len_str);
    strcat(packet, "\r\n\r\n");
    strcat(packet, "{\"value\":\"");
    strcat(packet, val_str);
    strcat(packet, "\"}");

    int total_len = strlen(packet);
    xil_printf("Sending Temp: %s to Cloud...\r\n", val_str);

    // Send sequence
    send_at_cmd("AT+CIPSTART=\"TCP\",\"io.adafruit.com\",80\r\n", 4000);
    
    Esp32_Print("AT+CIPSEND=");
    light_int_to_str(total_len, cmd_len_str);
    Esp32_Print(cmd_len_str);
    Esp32_Print("\r\n");
    
    smart_delay_ms(1000); // Wait for >
    Esp32_ClearBuffer();
    
    Esp32_Print(packet);
    smart_delay_ms(3000); // Wait for SEND OK
    
    send_at_cmd("AT+CIPCLOSE\r\n", 500);
}

// ==========================================================
// 6. TEMP SENSOR FUNCTIONS
// ==========================================================
float get_real_temperature() {
    u8 RegPtr = ADT7420_TEMP_REG;
    u8 RecvBuffer[2];
    int ByteCount;
    int16_t raw_temp;
    
    // Write Pointer
    ByteCount = XIic_Send(IIC_BASE_ADDRESS, ADT7420_ADDR, &RegPtr, 1, XIIC_STOP);
    if (ByteCount != 1) return -999.0;

    // Read Data
    ByteCount = XIic_Recv(IIC_BASE_ADDRESS, ADT7420_ADDR, RecvBuffer, 2, XIIC_STOP);
    if (ByteCount != 2) return -999.0;

    // Convert
    raw_temp = (RecvBuffer[0] << 8) | RecvBuffer[1];
    return raw_temp / 128.0f;
}

// ==========================================================
// 7. OLED DISPLAY FUNCTIONS
// ==========================================================
void UpdateOLED(float temperature) {
    u16 bgColor;
    int i;
    char tempStr[16];
    char int_buf[8], frac_buf[8];

    // Determine Logic
    if (temperature > TEMP_THRESHOLD) {
        bgColor = COLOR_RED; 
    } else {
        bgColor = COLOR_GREEN;
    }

    // Draw Background
    for(i = 0; i < 64; i++) {
        OLEDrgb_DrawLine(&oledDevice, 0, i, 95, i, bgColor);
    }

    // Format String
    int t_int = (int)temperature;
    int t_frac = (int)((temperature - t_int) * 100);
    if (t_frac < 0) t_frac = -t_frac;
    
    light_int_to_str(t_int, int_buf);
    light_int_to_str(t_frac, frac_buf);
    
    strcpy(tempStr, int_buf);
    strcat(tempStr, ".");
    if(t_frac < 10) strcat(tempStr, "0");
    strcat(tempStr, frac_buf);

    // Draw Text
    OLEDrgb_SetFontColor(&oledDevice, COLOR_WHITE);
    OLEDrgb_SetCursor(&oledDevice, 0, 1);
    OLEDrgb_PutString(&oledDevice, "Green House");

    OLEDrgb_SetCursor(&oledDevice, 0, 3); 
    OLEDrgb_PutString(&oledDevice, "T: ");
    OLEDrgb_PutString(&oledDevice, tempStr);
    OLEDrgb_PutString(&oledDevice, " C");

    OLEDrgb_SetCursor(&oledDevice, 0, 6);
    if (temperature > TEMP_THRESHOLD) {
        OLEDrgb_PutString(&oledDevice, "OVER HEATED!");
    } else {
        OLEDrgb_PutString(&oledDevice, "Optimal Temp");
    }
}

// ==========================================================
// 8. MAIN
// ==========================================================
int main() {
    Xil_ICacheEnable();
    Xil_DCacheEnable();

    xil_printf("\n\r--- INTEGRATED SYSTEM STARTING ---\n\r");

    // A. Init OLED (Note new addresses)
    xil_printf("1. Initializing OLED...\r\n");
    OLEDrgb_begin(&oledDevice, OLED_GPIO_BASE, OLED_SPI_BASE);
    SetupColors();
    OLEDrgb_Clear(&oledDevice);

    // B. Init ESP32
    xil_printf("2. Initializing Wi-Fi...\r\n");
    reset_esp32();
    connect_wifi();

    xil_printf("3. Starting Monitoring Loop...\r\n");

    float currentTemp;

    while(1) {
        // 1. Get Temperature
        currentTemp = get_real_temperature();
        
        if (currentTemp == -999.0) {
            xil_printf("Error reading sensor!\r\n");
            currentTemp = 0.0; // Safety default
        }

        // 2. Debug Print
        int t_int = (int)currentTemp;
        int t_frac = (int)((currentTemp - t_int) * 100);
        xil_printf("Current Temp: %d.%02d C\r\n", t_int, t_frac);

        // 3. Update OLED
        UpdateOLED(currentTemp);

        // 4. Check Threshold and Send to Cloud
        if (currentTemp > TEMP_THRESHOLD) {
            xil_printf("ALERT: Overheating! Uploading to Cloud...\r\n");
            send_temp_to_adafruit(currentTemp);
            
            // Wait longer after upload to avoid spamming the API
            sleep(10); 
        } else {
            // Normal operation delay
            sleep(2);
        }
    }
    return 0;
}