clear all;
clc;
close all;

% Given specifications
Ap = 0.8;
As = 0.2;
digital_pass = 0.2 * pi;
digital_stop = 0.6 * pi;

% Converting to db:
Pass_attenuation = -20 * log10 (Ap);
Stop_attenuation = -20 * log10 (As);
disp("Pass band attenuation in db is:");
disp(Pass_attenuation);
disp("Stop band attenuation in db is: ");
disp(Stop_attenuation );
disp("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");

n = 1;

% Calculating analog frequencies:
if (n == 1)
    T = 1;
    analog_pass = digital_pass / T;
    analog_stop = digital_stop / T;
else
    T = 2;
    analog_pass = (2 / T) * tan(digital_pass / 2);
    analog_stop = (2 / T) * tan(digital_stop / 2);
end
disp("Analog pass band frequency is:");
disp(analog_pass);
disp("Analog stop band frequency is:");
disp(analog_stop);
disp("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");

% Calculating order:
[N, CF] = buttord(analog_pass, analog_stop, Pass_attenuation, Stop_attenuation, 's');
disp("Order of filter is:");
disp(N);
disp("Cut-off frequency is:");
disp(CF);
disp("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");

disp("Transfer function of normalised analog filter is:");
[Bn, An] = butter(N, 1, 's');  % It returns CO-EFFICIENTS of transfer function of NORMALISED analog BUTTERWORTH filter.
HSn = tf(Bn, An)% Transfer function of NORMALISED analog BUTTERWORTH filter.
disp("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");

disp("Transfer function of De-normalised analog filter is:");
[B, A] = butter(N, CF, 's');% It returns CO-EFFICIENTS of transfer function of DENORMALISED analog BUTTERWORTH filter.
Hs = tf(B, A)% Transfer function of DENORMALISED analog BUTTERWORTH filter.
disp("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");

% S->Z mapping
if (n == 1)
    [num, den] = impinvar (B, A, 1 / T);
else
    [num, den] = bilinear (B, A, 1 / T);
end
disp("Transfer function of digital filter is:");
Hz = tf(num, den, T) % TF of DIGITAL Butter filter
disp("^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^");

w = 0:pi / 16:pi;
Hw = freqz(num, den, w);

subplot(211);
plot(w / pi,abs(Hw));
title("Magnitude response");

subplot(212);
plot(w / pi,phase(Hw));
title("Phase response");