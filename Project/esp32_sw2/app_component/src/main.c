#include "xparameters.h"
#include "xil_printf.h"
#include "xil_io.h"
#include "sleep.h"
#include <string.h>
#include <stdio.h>

// ==========================================================
// 1. CONFIGURATION
// ==========================================================
// GPIO Address (Reset pin)
#define ESP32_GPIO_BASE  0x44A00000  

// UART Address (Data transmission)
#define ESP32_UART_BASE  0x44A10000  

// UART Register Offsets
#define UART_RX_FIFO    0x0
#define UART_TX_FIFO    0x4
#define UART_STAT_REG   0x8
#define STS_RX_VALID    0x01
#define STS_TX_FULL     0x08

// ==========================================================
// 2. CREDENTIALS
// ==========================================================
#define SSID          "Pixel"             
#define PASS          "12345678a"         
#define AIO_USERNAME  "RK_Saleh"          
#define AIO_KEY       "AIO_key" 
#define FEED_KEY      "esp32"             

// ==========================================================
// 3. LOW LEVEL DRIVERS (SMART DELAY ADDED)
// ==========================================================
void light_int_to_str(int n, char* buffer) {
    int i = 0, isNeg = 0;
    if (n < 0) { isNeg = 1; n = -n; }
    do { buffer[i++] = (n % 10) + '0'; n /= 10; } while (n);
    if (isNeg) buffer[i++] = '-';
    buffer[i] = '\0';
    for (int j = 0, k = i - 1; j < k; j++, k--) {
        char temp = buffer[j]; buffer[j] = buffer[k]; buffer[k] = temp;
    }
}

void Esp32_WriteByte(u8 data) {
    while ((Xil_In32(ESP32_UART_BASE + UART_STAT_REG) & STS_TX_FULL));
    Xil_Out32(ESP32_UART_BASE + UART_TX_FIFO, data);
}

void Esp32_Print(const char *str) {
    while (*str) Esp32_WriteByte(*str++);
}

int Esp32_IsRxEmpty() {
    return !(Xil_In32(ESP32_UART_BASE + UART_STAT_REG) & STS_RX_VALID);
}

u8 Esp32_ReadByte() {
    return (u8)Xil_In32(ESP32_UART_BASE + UART_RX_FIFO);
}

void Esp32_ClearBuffer() {
    while (!Esp32_IsRxEmpty()) Esp32_ReadByte();
}

// *** CRITICAL FIX: SMART DELAY ***
// This function sleeps in tiny 10ms increments.
// It checks the UART buffer constantly so we don't miss data 
// or overflow the 16-byte FIFO while waiting.
void smart_delay_ms(int ms) {
    for (int i = 0; i < ms; i += 10) {
        usleep(10000); // Sleep 10ms
        while (!Esp32_IsRxEmpty()) {
            // Print whatever the ESP32 sends immediately
            xil_printf("%c", Esp32_ReadByte()); 
        }
    }
}

void send_at_cmd(const char *cmd, int wait_ms) {
    xil_printf("CMD: %s", cmd);
    Esp32_Print(cmd);
    // Use smart delay instead of blocking sleep
    smart_delay_ms(wait_ms); 
    xil_printf("\r\n");
}

// ==========================================================
// 4. MAIN LOGIC
// ==========================================================

void reset_esp32() {
    xil_printf("--- Resetting ESP32 ---\r\n");
    Xil_Out32(ESP32_GPIO_BASE, 0x0); // Reset Low
    usleep(100000);
    Xil_Out32(ESP32_GPIO_BASE, 0x1); // Release High
    sleep(3); 
    Esp32_ClearBuffer();
}

void connect_wifi() {
    xil_printf("\r\n--- Connecting to WiFi (WPA2 Fix) ---\r\n");
    
    // Factory reset to clear stuck settings
    send_at_cmd("AT+RESTORE\r\n", 3000); 
    
    send_at_cmd("AT+CWMODE=1\r\n", 500);
    send_at_cmd("AT+CWQAP\r\n", 500);

    xil_printf("Sending Credentials...\r\n");
    Esp32_Print("AT+CWJAP=\"");
    Esp32_Print(SSID);
    Esp32_Print("\",\"");
    Esp32_Print(PASS);
    Esp32_Print("\"\r\n");
    
    // Use Smart Delay here too for the 15s wait
    xil_printf("Waiting for connection (15s)...\r\n");
    smart_delay_ms(15000);
    xil_printf("\r\n");
    
    send_at_cmd("AT+CIFSR\r\n", 1000);
}

void send_to_adafruit(int value) {
    char val_str[12], len_str[12], cmd_len_str[32];
    light_int_to_str(value, val_str);
    
    // FIX 1: Correct Math. Wrapper {"value":"..."} is 12 chars + value length
    int payload_len = 12 + strlen(val_str);
    
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
    
    // JSON Body
    strcat(packet, "{\"value\":\"");
    strcat(packet, val_str);
    // FIX 2: Removed trailing \r\n so "Content-Length" matches EXACTLY what we send
    strcat(packet, "\"}"); 
    
    int total_len = strlen(packet);
    xil_printf("Sending %d bytes...\r\n", total_len);
    
    // 1. Start Connection (Smart Wait)
    send_at_cmd("AT+CIPSTART=\"TCP\",\"io.adafruit.com\",80\r\n", 5000);
    
    // 2. Prepare to send
    Esp32_Print("AT+CIPSEND=");
    light_int_to_str(total_len, cmd_len_str);
    Esp32_Print(cmd_len_str);
    Esp32_Print("\r\n");
    
    // 3. Wait for '>' prompt (Smart Wait)
    smart_delay_ms(1000);
    Esp32_ClearBuffer();
    
    // 4. Send Packet
    Esp32_Print(packet);
    
    // 5. Wait for Response (Smart Wait)
    // Server should now reply "SEND OK" followed by HTTP 200 OK
    smart_delay_ms(3000);

    send_at_cmd("AT+CIPCLOSE\r\n", 1000);
}
int main() {
    xil_printf("\r\n--- FINAL SYSTEM v3.0 (Smart Delay) ---\r\n");
    
    reset_esp32();
    connect_wifi();
    
    int count = 0;
    while(1) {
        count++;
        xil_printf("Loop %d\r\n", count);
        send_to_adafruit(count);
        xil_printf("Waiting 20s...\r\n");
        sleep(20);
    }
    return 0;
}