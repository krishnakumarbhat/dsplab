% If DFT{x(n)} = X(k), then
% DFT{x(n+N)} = X(k)

clc
clear all
close all

N=4;    %period
n=1:N;
k=1:N;
t=0:3;
x(n) = [2,3,7,10];

% Getting LHS of theorem:
LHS = fft(x);
subplot(2,2,1)
stem(t,abs(LHS))
title("Magnitude of LHS")
ylabel('Amplitude ---->');
xlabel('K ---->');

subplot(2,2,2)
stem(t,angle(LHS))
title("Phase of LHS")
ylabel('Phase ---->');
xlabel('K ---->');

% Getting RHS of theorem:
RHS = fft(x(mod(n+N,N+1)+1));
subplot(2,2,3)
stem(t,abs(RHS))
title("Magnitude of RHS")
ylabel('Amplitude ---->');
xlabel('K ---->');

subplot(2,2,4)
stem(t,angle(RHS))
title("Phase of RHS")
ylabel('Phase ---->');
xlabel('K ---->');