# Servo Motor Position Control with PID Controller

## Overview

This project focuses on the modeling, simulation, and PID control of a servo motor position control system using MATLAB and Simulink.

The main goal of the project is to control the angular position of a servo motor and make the motor reach a desired reference position of π radians, which corresponds to 180 degrees. The system is modeled using a second-order differential equation, and a PID controller is designed to improve the transient and steady-state response of the motor.

The complete system was implemented in Simulink, tuned using MATLAB PID Tuner, and evaluated using performance metrics such as rise time, settling time, overshoot, and closed-loop stability.

## Project Objective

The objective of this project is to design a PID controller for a servo motor position control system.

The controller should:

- Drive the motor position from 0 radians to π radians
- Reduce steady-state error
- Provide a fast response
- Keep the closed-loop system stable
- Evaluate system performance using simulation results

## System Description

The servo motor controls the position of a rotating arm. The input of the system is the control signal voltage, and the output is the angular position of the motor.

The motor dynamics are represented by the following second-order differential equation:

```text
J * d²θ(t)/dt² + B * dθ(t)/dt = Kt * u(t)
```

where:

| Symbol | Description | Unit |
|---|---|---|
| θ(t) | Angular position of the motor | rad |
| u(t) | Input control signal | V |
| J | Moment of inertia | kg·m² |
| B | Damping coefficient | N·m·s/rad |
| Kt | Torque constant | N·m/A |

The equation can be rearranged as:

```text
θ¨(t) = (Kt / J) * u(t) - (B / J) * θ˙(t)
```

This form was used to build the Simulink model using Gain, Sum, and Integrator blocks.

## System Parameters

The following parameters were used in the simulation:

| Parameter | Value | Unit |
|---|---:|---|
| Moment of inertia, J | 0.005 | kg·m² |
| Damping coefficient, B | 0.6 | N·m·s/rad |
| Torque constant, Kt | 0.08 | N·m/A |
| Desired position, θdesired | π ≈ 3.1416 | rad |
| Initial position, θ0 | 0 | rad |

The calculated gain values are:

| Gain | Formula | Value |
|---|---|---:|
| K1 | Kt / J | 16 |
| K2 | B / J | 120 |

## Simulink Model

The servo motor model was implemented in Simulink using the rearranged differential equation.

The system contains:

- Reference input for the desired angular position
- Error calculation block
- PID Controller block
- Gain blocks for motor parameters
- Sum block for acceleration calculation
- Two integrators:
  - First integrator calculates angular velocity
  - Second integrator calculates angular position
- Feedback path from motor position to the error calculation block
- Scope block for observing the output response

The general control structure is:

```text
Reference Position → Error Calculation → PID Controller → Servo Motor Model → Angular Position Output
                                      ↑                                      |
                                      |______________________________________|
```

## PID Controller Design

A PID controller was used to improve the position tracking performance of the servo motor.

The PID controller calculates the control input based on the position error:

```text
e(t) = θdesired - θ(t)
```

The controller was tuned using MATLAB PID Tuner.

The controller type used in the project was:

```text
Type: PIDF
Form: Parallel
Domain: Time
```

## Tuned PID Parameters

The tuned PID controller parameters obtained from MATLAB PID Tuner are:

| Parameter | Value |
|---|---:|
| Proportional Gain, P | 1310.853 |
| Integral Gain, I | 23747.765 |
| Derivative Gain, D | 8.0215 |
| Filter Coefficient, N | 16137.2607 |

These parameters were applied to the PID Controller block in Simulink.

## Simulation Results

The system was simulated in Simulink to observe how the motor position responds to the reference input.

The output position starts from 0 radians, rises rapidly toward the target value of π radians, shows a small overshoot, and then settles around the desired position.

The final response shows that the controller successfully tracks the reference position with nearly zero steady-state error.

## Performance Summary

| Metric | Value |
|---|---:|
| Rise Time | 0.011 seconds |
| Settling Time | 0.0979 seconds |
| Overshoot | 10.6% |
| Peak Value | 1.11 × π ≈ 3.49 rad |
| Phase Margin | 76.5° @ 141 rad/s |
| Closed-loop Stability | Stable |

## Result Evaluation

### Position Accuracy

The system reaches the desired angular position of π radians. The steady-state error is approximately zero. This is mainly due to the integral part of the PID controller, which helps eliminate steady-state tracking error.

### Response Time

The system has a fast transient response. The rise time is 0.011 seconds, and the settling time is approximately 0.0979 seconds. This means the motor reaches and settles near the desired position in less than 0.1 seconds.

### Overshoot

The system has an overshoot of 10.6%. This means the motor briefly exceeds the target position before settling. For many servo motor applications, this amount of overshoot may be acceptable. However, for more sensitive positioning systems, the overshoot could be reduced by tuning the controller toward a more robust response.

### Stability

The closed-loop system is stable. The phase margin is 76.5 degrees at 141 rad/s, which indicates a stable and robust control system.

## Files

| File | Description |
|---|---|
| `hw4_parameters.m` | MATLAB script containing system parameters such as J, B, Kt, K1, K2, and desired position |
| `hw4_servo_pid.slx` | Simulink model of the servo motor PID control system |
| `Servo_Motor_PID_Control_Report.pdf` | Project report including system modeling, PID tuning, simulation results, and performance evaluation |
| `assignment.pdf` | Original homework description |
| `images/simulink_model.png` | Screenshot of the Simulink block diagram |
| `images/pid_tuner_step_response.png` | PID Tuner step response plot |
| `images/pid_controller_parameters.png` | Tuned PID parameters and performance metrics |
| `images/scope_output.png` | Scope output of the angular position response |

## How to Run the Project

1. Open MATLAB.
2. Open the project folder.
3. Run the parameter script:

```matlab
hw4_parameters
```

4. Open the Simulink model:

```matlab
open_system('hw4_servo_pid.slx')
```

5. Run the Simulink simulation.
6. Observe the angular position response using the Scope block.
7. Open the PID Controller block if you want to view or retune the controller parameters.

## Example Outputs

### Simulink Model

![Simulink Model](images/simulink_model.png)

### PID Tuner Step Response

![PID Tuner Step Response](images/pid_tuner_step_response.png)

### PID Controller Parameters

![PID Controller Parameters](images/pid_controller_parameters.png)

### Scope Output

![Scope Output](images/scope_output.png)

## What I Learned

Through this project, I practiced:

- Modeling a physical system using differential equations
- Building a servo motor model in Simulink
- Using Gain, Sum, and Integrator blocks
- Designing a closed-loop feedback control system
- Applying PID control for position tracking
- Tuning PID parameters using MATLAB PID Tuner
- Evaluating transient response and steady-state behavior
- Interpreting rise time, settling time, overshoot, and stability margins

## Conclusion

In this project, a PID-controlled servo motor position control system was successfully modeled and simulated using MATLAB and Simulink. The servo motor plant was derived from the given second-order differential equation and implemented using basic Simulink blocks.

The PID controller was tuned using MATLAB PID Tuner. The simulation results show that the motor reaches the desired reference position of π radians with nearly zero steady-state error, fast response time, and stable closed-loop behavior.

Overall, the project demonstrates the practical use of PID control, Simulink-based system modeling, and performance analysis for a servo motor position control application.

## Author

Elif Sude ÖZTÜRK  
Electronics and Communications Engineering  
Izmir Institute of Technology
