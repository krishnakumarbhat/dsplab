% If DFT{x(n)} = X(k), then
% DFT{x((n-m))N} = W(mk)N * X(k)
clc
clear all
close all

% Initialising variables
N = 5;  %Period of signal
n = 0:N-1;
k = 0:N-1;
m = 2; %Circular shift unit

% Original signal
x = [1,2,3,4,5];
subplot(3,2,1);
stem(n,x);
title("Original signal");
ylabel('x(n) ---->');
xlabel('K ---->');

% Finding X(k)
X = fft(x);

% Circularly shifted signal
y = circshift(x,m); %x((n-m))to the base5
subplot(3,2,2);
stem(n,y);
title("Circularly shifted signal")
ylabel('x(n-m) ---->');
xlabel('K ---->');

% Finding LHS and RHS
LHS = fft(y)
RHS = exp(-j*2*pi*m*k/N).*X

% Plotting LHS and RHS
subplot(3,2,3);
stem(n,abs(LHS));
title("Magnitude of LHS")
ylabel('Amplitude ---->');
xlabel('K ---->');

subplot(3,2,4);
stem(n,abs(RHS));
title("Magnitude of RHS")
ylabel('Amplitude ---->');
xlabel('K ---->');

subplot(3,2,5);
stem(n,angle(LHS));
title("Phase of LHS")
ylabel('Phase ---->');
xlabel('K ---->');

subplot(3,2,6);
stem(n,angle(RHS));
title("Phase of RHS")
ylabel('Phase ---->');
xlabel('K ---->');