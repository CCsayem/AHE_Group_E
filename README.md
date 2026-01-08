# IoT-Based Temperature Monitoring System for Greenhouses

## 📌 Project Overview
This project implements an intelligent, real-time temperature monitoring system tailored for greenhouse environments. Powered by the **Artix-7 FPGA (Nexys A7)** and an **ESP32** microcontroller, the system ensures zero-latency local monitoring while simultaneously streaming data to the **Adafruit IO** cloud for remote access.

### ⚠️ Project Versions
We developed and tested two distinct versions of this system during our research:
1.  **Pmod TMP3 Version (Final Submission):** Utilizes the external Pmod TMP3 sensor via a custom I2C bit-banging implementation. **This is our primary submission.**
2.  **On-Board Sensor Version (Additional Work):** Utilizes the Nexys A7's built-in ADT7420 temperature sensor. This version serves as a backup and demonstrates our ability to interface with on-board peripherals.

---

## 🚀 Key Features
* **Real-Time Sensing:** precise temperature acquisition using the Pmod TMP3 (I2C) or On-board ADT7420.
* **Visual Status Indicator:**
    * 🟢 **Green:** Optimal Temperature ($< 20^\circ$C).
    * 🔴 **Red:** Overheat Alert ($> 20^\circ$C).
* **IoT Integration:** Wireless data transmission to Adafruit IO dashboard via Pmod ESP32 (AT Commands).
* **Fault Detection:** Automatic alert on the OLED display if the sensor is disconnected.

## 🛠️ Hardware Requirements
* **FPGA Board:** Digilent Nexys A7-100T
* **Wi-Fi Module:** Pmod ESP32
* **Display:** Pmod OLED RGB
* **Sensor:** Pmod TMP3 (Primary) / On-board ADT7420 (Secondary)

## 💻 Software Tools
* **Hardware Design:** Xilinx Vivado Design Suite 2024.1
* **Embedded Software:** Xilinx Vitis Unified Software Platform
* **Cloud Platform:** Adafruit IO

## ⚙️ System Architecture
The system is built around a **MicroBlaze** soft-core processor.
* **Hardware:** AXI GPIO (Sensor), AXI UARTLite (ESP32), and PmodOLEDrgb IP are connected via an AXI4-Lite interconnect.
* **Software:** The application runs a continuous loop that reads raw sensor data, updates the OLED display via SPI, and pushes JSON payloads to the cloud via UART/Wi-Fi.

## 👥 Team Members
* **Abu Sayem**
* **Ikramul Hassan Sazid**
* **Md Ruhul Kuddus Saleh**

---
*For a detailed breakdown of tasks and individual contributions, please refer to the `Team_Tasks.xlsx` file in this repository.*
