clc;
clear all;
close all;

%Variables declaration and initialization:
x=[0,1,2,1];
N=length(x);
X=zeros(N,1);

disp('DFT is: ');
X=fft(x);
X

n=0:N-1;

subplot(311)
stem(n,x)
title("Input discrete signal:")

subplot(312)
stem(n,abs(X))
title("Magnitude response of DFT:")

subplot(313)
stem(n,angle(X))
title("Phase response of DFT:")

disp("IDFT is:")
ifft(X)