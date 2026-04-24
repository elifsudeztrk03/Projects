clc; clear; close all;

%%  4.1 Data Acquisition 
[fn, fp] = uigetfile('*.wav','Select your WAV recording');
if isequal(fn,0), error('No file selected.'); 
end

file = fullfile(fp, fn);

[x, Fs] = audioread(file);
if size(x,2) > 1
    x = mean(x,2);              % stereo -> mono
end

N = length(x);
t = (0:N-1)/Fs;
Trec = N/Fs;

fprintf("File: %s\n", file);
fprintf("Fs: %.0f Hz\n", Fs);
fprintf("Total duration: %.3f s\n\n", Trec);

%%  4.2 Time Domain (short segment + full) 
figure('Name','Time domain - full');
plot(t, x, 'r'); 
grid on;
xlabel('Time (s)');
ylabel('Amplitude');
title('Recorded signal (full)');

% short segment
t1 = 0; t2 = min(1.5, Trec);
idx = (t>=t1) & (t<=t2);

figure('Name','Time domain - short segment');
plot(t(idx), x(idx), 'r');
grid on;
xlabel('Time (s)'); 
ylabel('Amplitude');
title(sprintf('Short segment (%.2f–%.2f s)', t1, t2));

%%  4.2 Segmentation into 8 notes 

parts = [0.9429 1.8700 2.7950 3.7648 4.6786 5.6439 6.5940 7.5731 8.6186];

note_Duration = diff(parts);
fprintf("Boundaries (s):\n"); 
disp(parts);
fprintf("Note durations (s):\n"); 
disp(note_Duration);
fprintf("Mean note duration: %.3f s\n\n", mean(note_Duration));

mini = min(note_Duration);
min_sampling = floor(mini*Fs);

notes = zeros(8,min_sampling); % Defining slots for 8 different notes
notes_t = zeros(8,min_sampling);

for k = 1:8
    i0 = floor(parts(k)*Fs);
    notes(k,:) = x(i0:i0+min_sampling-1);
    notes_t(k,:) = (i0:min_sampling+i0-1)/Fs;
end


figure('Name','Each Note Signal');
for i = 1:8
    subplot(4,2,i);
    plot(notes_t(i,:), notes(i,:), 'r');
    xlabel('t(s)'); 
    ylabel('Amplitude');
    grid on;
end

%% 4.2 FFT Original singal

X = fft(x);
X = fftshift(X);
Nfft = length(X);
f = (-Nfft/2:Nfft/2 -1)*(Fs/Nfft);

figure('Name','FFT of Original Signal');
plot(f,abs(X),'r');
xlabel('Frequency'); 
ylabel('Amplitude');
xlim([-1500 1500]);
grid on;


%% 4.2 FFT per note + fundamental frequency 

Xnotes = zeros(8,min_sampling);
Xnotes_f = (-min_sampling/2:min_sampling/2-1)*(Fs/min_sampling);
meas_f0 = zeros(1,8);
Dominant_Peak = zeros(8,2);


for k = 1:8
    part = floor(parts(k)*Fs);
    segment = fft(x(part:part+min_sampling), min_sampling);
    Xnotes(k,:) = fftshift(segment);
    
    Dominant_Peak(k,1) = max(abs(Xnotes(k,:)));
    for i = 1:min_sampling
        if Dominant_Peak(k,1) == max(abs(Xnotes(k,i)))
            Dominant_Peak(k,2) = Xnotes_f(i);
            meas_f0(k) = Dominant_Peak(k,2);
        end
    end
    
end

figure('Name','FFT of Each Note Signal');
for i = 1:8
    subplot(4,2,i);
    plot(Xnotes_f, abs(Xnotes(i,:)), 'r');
    xlabel('freq'); 
    ylabel('Amplitude');
    xlim([-1500 1500]);
    grid on;
end

fprintf("Measured f0 (Hz):\n"); disp(meas_f0);

%% 4.2 Frequency table (theoretical + error) 

noteNames = ["C4","D4","E4","F4","G4","A4","B4","C5"];
theo_f = [261.63 293.66 329.63 349.23 392.00 440.00 493.88 523.25];

err_pct = abs(meas_f0 - theo_f)./theo_f * 100;

T = table((1:8)', noteNames', meas_f0', theo_f', err_pct', ...
    'VariableNames', {'Index','Note','Measured_Hz','Theoretical_Hz','Error_percent'});
disp("==== Frequency Table ====");
disp(T);

%% 4.3 Filter design (band-pass) 
target = 7;
f0 = meas_f0(target);

DeltaF = 15;                           % +/- bandwidth (Hz)

bp = [f0-DeltaF f0+DeltaF];
Wn = bp/(Fs/2);

order = 10;
[A,B,C,D] = butter(order, Wn, 'bandpass');
sos = ss2sos(A,B,C,D);
y = sosfilt(sos,x);

fprintf("\nFilter: Butterworth band-pass\n");
fprintf("Target note: %d (%s)\n", target, noteNames(target));
fprintf("f0: %.2f Hz, passband: [%.2f %.2f] Hz, order: %d\n\n", f0, bp(1), bp(2), order);

%% 4.3 Compare original vs filtered 
figure('Name','Time comparison');
subplot(2,1,1); 
plot(t,x,'r'); 
grid on;
xlabel('s'); 
ylabel('Amp'); 
title('Original (time)');

subplot(2,1,2); 
plot(t,y,'r'); 
grid on;
xlabel('s'); 
ylabel('Amp'); 
title('Filtered (time)');

Nfft = length(x);

Xfull = fft((x-mean(x)).*hann(length(x)), Nfft);  %önce DC kalktı sonra spectrum yumuşatma yapıldı, en son da fft alındı
Yfull = fft((y-mean(y)).*hann(length(y)), Nfft);

magX = abs(Xfull(1:Nfft/2));  % pozitif kısmını alıyoruz
magY = abs(Yfull(1:Nfft/2));

f_positive = (0:Nfft/2-1)*(Fs/Nfft);

figure('Name','Spectrum comparison');

subplot(2,1,1); 
plot(f_positive,magX,'r'); 
grid on; 
xlim([0 1500]);
xlabel('Hz'); 
ylabel('|X(f)|'); 
title('Original spectrum');

subplot(2,1,2); 
plot(f_positive,magY,'r'); 
grid on; 
xlim([0 1500]);
xlabel('Hz'); 
ylabel('|Y(f)|'); 
title('Filtered spectrum');

%% 4.3 Playback 
disp("Playing ORIGINAL...");
soundsc(x,Fs);
pause(Trec+0.5);
disp("Playing FILTERED...");
soundsc(y,Fs);

% For the export the filtered audio for target note
text = noteNames(target) + '_filtered_output.wav';
audiowrite(text,y, Fs);

