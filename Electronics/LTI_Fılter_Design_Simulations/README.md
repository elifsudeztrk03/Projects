# Wien Bridge and Schmitt Trigger Oscillators

This project focuses on the design, analysis, and simulation of **Wien Bridge** and **Schmitt Trigger oscillators** using operational amplifiers.  
It was developed as part of an Electronics course.

---

## Project Overview

Two classical oscillator topologies are studied:

### Wien Bridge Oscillator
- RC-based frequency selective network
- Oscillation condition and gain requirement analysis
- Frequency behavior analysis under resistor variation

### Schmitt Trigger Oscillator
- Positive feedback and hysteresis behavior
- Square wave generation
- Threshold voltage analysis

Both circuits are verified through **LTspice simulations**, supported by analytical calculations and MATLAB-based parameter analysis.

---

## Folder Structure
```
Wien_Bridge_and_Schmitt_Trigger/
│
├── LTspice/
│ ├── *.asc
│ ├── *.raw
│ └── *.plt
│
├── Schematics/
│ └── Circuit diagrams (PNG)
│
├── Simulations/
│ └── MATLAB analysis scripts
│
├── Figures/
│ └── Handwritten calculations and plots
│
├── Assignment.pdf
└── Report.pdf
```

---

## How to Run the Simulations

1. Open **LTspice XVII**
2. Navigate to the `LTspice/` folder
3. Open any `.asc` file
4. Simulation results and plots will load automatically

No external models or additional configuration are required.

---

## Tools & Technologies

- **LTspice XVII** – Circuit design and transient analysis  
- **MATLAB** – Parameter sweep and frequency analysis

---

## Theoretical Background
- Oscillator stability and Barkhausen criterion
- Positive feedback and amplitude stabilization

---

## Key Outcomes

- Verified oscillation conditions for both oscillator types  
- Observed frequency behavior under parameter variation  
- Correlated analytical results with simulation data  

---


