#include "xparameters.h"
#include "xil_cache.h"
#include "PmodOLEDrgb.h"
#include "sleep.h"
#include <stdbool.h> 

// ==========================================
// 1. HARDCODED ADDRESSES 
// ==========================================
#define GPIO_BASE 0x44A00000
#define SPI_BASE  0x44A10000

// Temperature threshold
#define TEMP_THRESHOLD 10

// ==========================================
// 2. GLOBAL VARIABLES
// ==========================================
PmodOLEDrgb oledDevice;
u16 COLOR_RED, COLOR_GREEN, COLOR_WHITE, COLOR_BLACK;

// ==========================================
// 3. HELPER FUNCTIONS
// ==========================================
void SetupColors() {
    COLOR_RED   = OLEDrgb_BuildRGB(255, 0, 0);
    COLOR_GREEN = OLEDrgb_BuildRGB(0, 255, 0);
    COLOR_WHITE = OLEDrgb_BuildRGB(255, 255, 255);
    COLOR_BLACK = OLEDrgb_BuildRGB(0, 0, 0);
}

void IntToString(int value, char* buffer) {
    // Handle negative numbers
    if (value < 0) {
        buffer[0] = '-';
        value = -value;
        if (value < 10) {
            buffer[1] = value + '0';
            buffer[2] = '\0';
        } else {
            buffer[1] = (value / 10) + '0';
            buffer[2] = (value % 10) + '0';
            buffer[3] = '\0';
        }
    } else if (value < 10) {
        buffer[0] = value + '0';
        buffer[1] = '\0';
    } else if (value < 100) {
        buffer[0] = (value / 10) + '0';
        buffer[1] = (value % 10) + '0';
        buffer[2] = '\0';
    } else {
        // Handle 100+
        buffer[0] = (value / 100) + '0';
        buffer[1] = ((value / 10) % 10) + '0';
        buffer[2] = (value % 10) + '0';
        buffer[3] = '\0';
    }
}

// Function to update the screen
void UpdateDisplay(int temperature) {
    u16 bgColor;
    int i; 
    
    // --- DETERMINE BACKGROUND COLOR ---
    // Modified Logic: > 10 is Red. 10 or below is Green.
    if (temperature > TEMP_THRESHOLD) {
        bgColor = COLOR_RED; 
    } else {
        bgColor = COLOR_GREEN;
    }
    
    // --- DRAWING ---
    
    // 1. Draw Background (MANUAL LINE MODE)
    for(i = 0; i < 64; i++) {
        OLEDrgb_DrawLine(&oledDevice, 0, i, 95, i, bgColor);
    }
    
    // 2. Draw Project Title at the TOP
    OLEDrgb_SetFontColor(&oledDevice, COLOR_WHITE);
    OLEDrgb_SetCursor(&oledDevice, 0, 0); 
    OLEDrgb_PutString(&oledDevice, "Green House");
    
    // 3. Draw Temperature Value in the MIDDLE
    char tempStr[6];
    IntToString(temperature, tempStr); 
    
    OLEDrgb_SetFontColor(&oledDevice, COLOR_WHITE);
    OLEDrgb_SetCursor(&oledDevice, 0, 3); // Row 3 for middle
    OLEDrgb_PutString(&oledDevice, "Temp: ");
    OLEDrgb_PutString(&oledDevice, tempStr);
    OLEDrgb_PutString(&oledDevice, " C");
    
    // 4. Draw Status Message at the BOTTOM
    OLEDrgb_SetFontColor(&oledDevice, COLOR_WHITE); 
    OLEDrgb_SetCursor(&oledDevice, 0, 6); // Row 6 for bottom
    
    if (temperature > TEMP_THRESHOLD) {
        // Temp is 11 or higher
        OLEDrgb_PutString(&oledDevice, "Over Heated");
    } else {
        // Temp is 10 or lower
        OLEDrgb_PutString(&oledDevice, "Optimal Temp");
    }
}

// ==========================================
// 4. MAIN FUNCTION
// ==========================================
int main() {
    Xil_ICacheEnable();
    Xil_DCacheEnable();
    
    print("Initializing OLED System...\n\r");
    
    // A. Initialize Driver
    OLEDrgb_begin(&oledDevice, GPIO_BASE, SPI_BASE);
    
    // B. Build Colors
    SetupColors();
    
    // C. Clear Screen
    OLEDrgb_Clear(&oledDevice);
    
    print("OLED Initialized. Starting temperature monitoring...\n\r");
    
    // Simulation: Start at 8°C and cycle through values
    int currentTemp = 8; 
    
    while(1) {
        UpdateDisplay(currentTemp);
        
        print("Temperature: ");
        if(currentTemp < 10) {
            print(" ");
        }
        print((char[]){(currentTemp/10)+'0', (currentTemp%10)+'0', '\0'});
        print(" C\n\r");
        
        // Simulate temperature changes
        currentTemp++;
        if(currentTemp > 13) {
            currentTemp = 8; 
        }
        
        sleep(2); // Update every 2 seconds
    }
    
    return 0;
}