% If DFT{x(n)} = X(k), then
% DFT{x*(n)} = X*(N-k) / X*((-k))N

clc
clear all
close all

N=4;    %period
n=1:N;
k=1:N;
x(n) = [2,3,7,10];

% Getting LHS of theorem:
X(k) = fft(conj(x));
LHS = X;
subplot(2,2,1)
stem(n,abs(LHS))
title("Magnitude of LHS")
ylabel('Amplitude ---->');
xlabel('K ---->');

subplot(2,2,2)
stem(n,angle(LHS))
title("Phase of LHS")
ylabel('Angle ---->');
xlabel('K ---->');

% Getting RHS of theorem:
K=2:N;
RHS = X(1);
for k=2:N
    RHS(k) = fft(conj(X(N+2-k)));
end
subplot(2,2,3)
stem(n,abs(RHS))
title("Magnitude of RHS")
ylabel('Amplitude ---->');
xlabel('K ---->');

subplot(2,2,4)
stem(n,angle(RHS))
title("Phase of RHS")
ylabel('Angle ---->');
xlabel('K ---->');