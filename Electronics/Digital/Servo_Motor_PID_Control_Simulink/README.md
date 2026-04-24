# Audio Signal Analysis and GUI-Based Filtering with MATLAB

## Overview

This project focuses on the analysis and filtering of a real audio signal using MATLAB.  
An audio recording consisting of eight successive musical notes was recorded, analyzed in both time and frequency domains, and processed using a digital Butterworth bandpass filter.

The main objective of the project is to determine the fundamental frequencies of musical notes, compare the measured values with theoretical frequencies, and isolate a selected note from the original audio signal.

A MATLAB-based graphical user interface (GUI) was also developed to make the signal analysis and filtering process more interactive.

## Project Objectives

- Record and analyze a real audio signal containing musical notes
- Segment the audio signal into individual note regions
- Analyze the signal in the time domain
- Apply Fast Fourier Transform (FFT) for frequency-domain analysis
- Determine the fundamental frequency of each note
- Compare measured frequencies with theoretical note frequencies
- Design and apply a Butterworth bandpass filter
- Isolate the selected B4 note from the original audio
- Develop a MATLAB GUI for visualization and filtering

## Tools Used

- MATLAB
- MATLAB App Designer
- Signal Processing Toolbox
- Fast Fourier Transform (FFT)
- Butterworth bandpass filter
- Second-order sections (SOS)
- WAV audio files

## Project Description

The original audio signal was recorded as a WAV file and loaded into MATLAB using the `audioread` function.  
The signal contains eight successive musical notes between C4 and C5.

The full signal was first plotted in the time domain to observe the overall structure of the recording. Then, the signal was manually divided into separate note segments. Each note segment was analyzed individually to determine its dominant frequency component.

FFT analysis was used to obtain the frequency spectrum of both the complete signal and each individual note. The dominant spectral peak was considered as the measured fundamental frequency of the corresponding note.

The measured frequencies were compared with theoretical musical note frequencies, and the percentage error was calculated for each note.

## Digital Filtering

A Butterworth bandpass filter was designed to isolate the selected B4 note from the original audio signal.

The filter was designed around the measured fundamental frequency of the target note.  
A narrow bandwidth was selected to emphasize the B4 note while attenuating the other notes.

To improve numerical stability, the Butterworth filter was implemented using second-order sections (SOS). This approach provides a more stable filtering operation, especially for higher-order bandpass filters.

## GUI Application

A MATLAB GUI was developed to make the project more interactive.

The GUI allows the user to:

- Load a WAV audio file
- Display the original signal in the time domain
- Display the original signal in the frequency domain
- Select the filter type
- Select the filter order
- Select the target musical note
- Apply the selected filter
- Display the filtered signal in time and frequency domains
- Play both the original and filtered audio signals

## Results

The project successfully analyzed the recorded audio signal and extracted the fundamental frequencies of the notes.

The Butterworth bandpass filter was able to isolate the selected B4 note from the original audio.  
The filtered signal shows that the target note is emphasized while the other notes are significantly attenuated.

Small differences between the measured and theoretical frequencies were observed. These differences may be caused by:

- FFT resolution limitations
- Background noise during recording
- Manual segmentation errors
- Harmonic components
- Slight tuning differences in the instrument

## Files

| File | Description |
|---|---|
| `ElifSudeOZTURK_310206045.m` | Main MATLAB script for audio analysis, FFT, filtering, and GUI operations |
| `Original_ses.wav` | Original recorded audio signal |
| `B4_filtered_output.wav` | Filtered output audio file for the selected B4 note |
| `EE_331_FinalLab_Report.pdf` | Project report including methodology, figures, results, and discussion |
| `README.md` | Project documentation |

## Example Outputs

The project includes:

- Time-domain plot of the original recorded signal
- Short segment visualization
- Time-domain plots of each note
- FFT spectrum of the original signal
- FFT spectrum of each note
- Time-domain comparison of original and filtered signals
- Frequency-domain comparison before and after filtering
- Frequency comparison table
- MATLAB GUI for interactive filtering

## What I Learned

Through this project, I gained practical experience in:

- Real audio signal analysis
- Time-domain and frequency-domain signal processing
- FFT-based frequency estimation
- Digital Butterworth filter design
- Bandpass filtering
- Using second-order sections for stable filter implementation
- MATLAB GUI development
- Comparing measured and theoretical musical note frequencies

## Author

Elif Sude ÖZTÜRK  
Electronics and Communications Engineering  
Izmir Institute of Technology
