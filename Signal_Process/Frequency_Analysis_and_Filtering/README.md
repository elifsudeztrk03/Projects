# LTI Filter Design and Simulation with LTspice

## Overview

This project focuses on the design and simulation of continuous-time Linear Time-Invariant (LTI) systems using active Butterworth filters. The main objective is to separate individual frequency components from a composite input signal consisting of 500 Hz, 2 kHz, and 10 kHz sinusoidal signals.

To achieve this, three different active filter structures were designed and analyzed:

- 2nd-order low-pass Butterworth filter for extracting the 500 Hz component
- 2nd-order high-pass Butterworth filter for extracting the 10 kHz component
- 4th-order band-pass Butterworth filter for extracting the 2 kHz component

The circuit designs were implemented and verified using LTspice through both time-domain and frequency-domain simulations.

## Project Purpose

The goal of this project is to design filters that pass the desired frequency component while attenuating the unwanted frequency components.

The composite input signal includes:

- 500 Hz component
- 2 kHz component
- 10 kHz component

Each filter was designed to isolate one of these components.

## Tools Used

- LTspice
- Active filter design
- Butterworth filter theory
- Bode plot analysis
- Time-domain waveform analysis

## Filter Designs

### 1. Low-Pass Butterworth Filter

A 2nd-order low-pass Butterworth filter was designed to pass the 500 Hz component and attenuate higher-frequency components such as 2 kHz and 10 kHz.

The simulation results show that the low-pass filter successfully suppresses frequencies above the selected cutoff frequency. However, because the filter order is finite, the unwanted frequency components are attenuated but not completely removed.

### 2. High-Pass Butterworth Filter

A 2nd-order high-pass Butterworth filter was designed to pass the 10 kHz component and suppress lower-frequency components such as 500 Hz and 2 kHz.

The frequency response confirms that lower-frequency components are attenuated while the high-frequency signal is passed.

### 3. Band-Pass Butterworth Filter

A 4th-order band-pass Butterworth filter was designed by cascading a high-pass and a low-pass filter.

The selected passband is approximately:

- Lower cutoff frequency: 1 kHz
- Upper cutoff frequency: 3 kHz

This allows the 2 kHz component to pass while attenuating the 500 Hz and 10 kHz components.

## Simulation Results

The filters were tested using LTspice simulations. Both Bode plots and voltage-time graphs were used to evaluate the behavior of each filter.

The results show that:

- The low-pass filter passes the 500 Hz component.
- The high-pass filter passes the 10 kHz component.
- The band-pass filter passes the 2 kHz component.
- Unwanted frequencies are attenuated but not completely eliminated due to the finite filter order.
- Increasing the filter order would improve frequency selectivity and produce cleaner output waveforms.

## Files

| File | Description |
|---|---|
| `HW2_Filter.asc` | LTspice schematic file containing the filter circuits |
| `HW2_Filter.raw` | LTspice simulation output data |
| `HW2_Filter.log` | LTspice simulation log file |
| `HW2_Filter.fft` | FFT-related simulation data |
| `EE_313_HW2_Report.pdf` | Project report including calculations, circuit design, and simulation results |
| `images/` | Screenshots of Bode plots and time-domain waveforms |

## Example Simulation Outputs

### Low-Pass Filter Bode Plot

The low-pass filter attenuates frequencies above approximately 500 Hz.

### High-Pass Filter Bode Plot

The high-pass filter attenuates frequencies below approximately 10 kHz.

### Band-Pass Filter Bode Plot

The band-pass filter passes the frequency range between approximately 1 kHz and 3 kHz.

## What I Learned

Through this project, I improved my understanding of:

- Continuous-time LTI systems
- Butterworth filter design
- Active filter topologies
- Cutoff frequency selection
- Frequency-domain analysis using Bode plots
- Time-domain signal analysis
- LTspice circuit simulation

## Author

Elif Sude ÖZTÜRK  
Electronics and Communications Engineering  
Izmir Institute of Technology
