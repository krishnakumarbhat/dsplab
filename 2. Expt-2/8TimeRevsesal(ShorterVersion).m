%If DFT{x(n)} = X(k), then
%DFT{x(-n)} = X*(k)

clc;
close all;
clear all;

xn=[2,3,5,7];
N=length(xn);
Xk=fft(xn);

n=0:N-1;
x1n=xn(mod(-n,N)+1); %Time reversing original sequence
LHS=fft(x1n);
RHS=conj(Xk);

%Plotting
subplot(221);
stem(abs(LHS));
ylabel('Amplitude ---->');
xlabel('K ---->');
title('Magnitude of LHS');

subplot(222);
stem(angle(LHS));
ylabel('Angle ---->');
xlabel('K ---->');
title('Phase of LHS');

subplot(223);
stem(abs(RHS));
ylabel('Amplitude ---->');
xlabel('K ---->');
title('Magnitude of RHS');

subplot(224);
stem(angle(RHS));
ylabel('Angle ---->');
xlabel('K ---->');
title('Phase of RHS');
