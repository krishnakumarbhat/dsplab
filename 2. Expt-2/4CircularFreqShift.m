% If DFT{x(n)} = X(k), then
% IDFT{X((k-l))N} = W(-ln)N * x(n)

clc
clear all
close all

% Initialising variables
N = 5;  %Period of signal
n = 0:N-1;
l = 2; %Circular shift unit

% Original signal
x = [1,2,3,4,5];

% Finding X(k)
X = fft(x);
subplot(2,2,1);
stem(n,abs(X));
title("Magnitude of X(k)");
ylabel('Amplitude ---->');
xlabel('K ---->');

% Circularly Shifting X(k)
Y = circshift(X, l);
subplot(2,2,2);
stem(n,abs(Y));
title("Circularly Shifted X(k)");
ylabel('Amplitude ---->');
xlabel('K ---->');

% Finding LHS and RHS
LHS = ifft(Y);
subplot(2,2,3);
stem(n,LHS);
title("Plot of LHS");
ylabel('IDFT{X((k-l))N} ---->');
xlabel('n ---->');

RHS = exp(j*2*pi*l*n/N).*x;
subplot(2,2,4);
stem(n,RHS);
title("Plot of RHS");
ylabel('W(-ln)N*x(n) ---->');
xlabel('n ---->');
