clc
clear all
close all

% If DFT{x1(n)} = X1(k) and
% DFT{x2(n)} = X2(k), then
% DFT{a1*x1(n) + a2*x2(n)} = a1*X1(k) + a2*X2(k)

% Input discrete signals:
x1 = [2,3,4,5];
x2 = [12,13,14,15];

% DFT of two input signals:
X1 = fft(x1);
X2 = fft(x2);

% Scaling input signals:
a1 = 3;
a2 = 2;
t=0:3;

% Getting LHS of theorem:
LHS = fft((a1*x1)+(a2*x2))
subplot(2,2,1)
stem(t,abs(LHS))
title("Magnitude of LHS")
ylabel('Amplitude ---->');
xlabel('K ---->');

subplot(2,2,2)
stem(t,angle(LHS))
title("Phase of LHS")
ylabel('Angle ---->')
xlabel('K ---->')

% Getting RHS of theorem:
RHS = (a1*X1)+(a2*X2)
subplot(2,2,3)
stem(t,abs(RHS))
title("Magnitude of RHS")
ylabel('Amplitude ---->');
xlabel('K ---->');

subplot(2,2,4)
stem(t,angle(RHS))
title("Phase of RHS")
ylabel('Angle ---->')
xlabel('K ---->')