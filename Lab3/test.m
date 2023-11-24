% AM Modulation and Spectrum with Sidebands

% Parameters
Fs = 10e3;         % Sampling frequency
T = 1/Fs;           % Sampling period
t = 0:T:1;          % Time vector

% Message signal (sinusoidal)
Amplitude_message = 1;
f_message = 100;    % Frequency of the message signal
message_signal = Amplitude_message * sin(2*pi*f_message*t);

% Carrier signal (sinusoidal)
Amplitude_carrier = 1;
f_carrier = 1e3;    % Frequency of the carrier signal
carrier_signal = Amplitude_carrier * sin(2*pi*f_carrier*t);

% Modulated signal
modulation_index = 0.5;
modulated_signal = (1 + modulation_index * message_signal) .* carrier_signal;

% Calculate the spectrum
N = length(modulated_signal);
frequencies = Fs * (-N/2:N/2-1)/N;  % Frequency axis

% Use FFT to calculate the spectrum
spectrum = fftshift(fft(modulated_signal, N) / N);

% Plot the signals and spectrum with sidebands
figure;

subplot(3,1,1);
plot(t, message_signal);
title('Message Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3,1,2);
plot(t, carrier_signal);
title('Carrier Signal');
xlabel('Time (s)');
ylabel('Amplitude');

subplot(3,1,3);
plot(frequencies, abs(spectrum));
title('AM Modulated Signal Spectrum with Sidebands');
xlabel('Frequency (Hz)');
ylabel('Magnitude');

% Highlight sidebands in the spectrum
hold on;
sideband_indices = find(frequencies >= (f_carrier - f_message) & frequencies <= (f_carrier + f_message));
plot(frequencies(sideband_indices), abs(spectrum(sideband_indices)), 'r', 'LineWidth', 2);
hold off;

% Display the plot
grid on;