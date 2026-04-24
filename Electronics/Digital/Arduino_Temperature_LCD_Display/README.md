# Arduino Temperature LCD Display

## Overview

This project is an embedded system simulation developed using Arduino and Tinkercad.  
The system reads temperature data from an analog temperature sensor and displays the measured temperature value on a 16x2 LCD screen.

The main purpose of this project is to practice sensor interfacing, analog signal reading, LCD control, and basic embedded system design using Arduino.

## Project Objectives

- Design an Arduino-based temperature monitoring system
- Read analog temperature data from a temperature sensor
- Convert the analog sensor value into temperature in Celsius
- Display the measured temperature value on a 16x2 LCD screen
- Simulate the complete circuit in Tinkercad
- Use the LiquidCrystal library for LCD control

## Tools and Components Used

- Arduino Uno
- Temperature sensor
- 16x2 LCD display
- Potentiometer for LCD contrast adjustment
- Breadboard
- Jumper wires
- Tinkercad Circuits
- Arduino C/C++
- LiquidCrystal library

## Circuit Description

The temperature sensor is connected to the analog input pin of the Arduino.  
The Arduino reads the analog voltage value using `analogRead()`, converts this value into voltage, and then calculates the temperature in Celsius.

The calculated temperature value is displayed on a 16x2 LCD screen.  
A potentiometer is used to adjust the LCD contrast for better visibility.

## Code Explanation

The project uses the `LiquidCrystal` library to control the LCD display.

The Arduino reads the sensor value from analog pin A0:

```cpp
int raw = analogRead(A0);
