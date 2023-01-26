clear all;
clc;
close all;

Ap = 0.8;
As = 0.2;
digital_pass = 0.2 * pi;
digital_stop = 0.6 * pi;

Pass_attenuation = -20 * log10 (Ap);
Stop_attenuation = -20 * log10 (As);

n = input('Enter 1 for IIT\n Enter 2 for BLT')

if (n == 1)
    T = 1;
    analog_pass = digital_pass / T;
    analog_stop = digital_stop / T;
else
    T = 2;
    analog_pass = (2 / T) * tan(digital_pass / 2);
    analog_stop = (2 / T) * tan(digital_stop / 2);
end

[N, CF] = buttord(analog_pass, analog_stop, Pass_attenuation, Stop_attenuation, 's');

[Bn, An] = butter(N, 1, 's');
HSn = tf(Bn, An)

[B, A] = butter(N, CF, 's')
Hs = tf(B, A)

if (n == 1)
    [num, den] = impinvar (B, A, 1 / T);
else
    [num, den] = bilinear (B, A, 1 / T);
end

Hz = tf(num, den, T)

w = 0:pi / 16:pi;

Hw = freqz(num, den, w);
Hw_mag = abs(Hw);

plot(w / pi, Hw_mag);
title("Magnitude response");