clc
clear all
close all

% Original signal
x = [1,2,3,4,5];

% Finding X(k)
X = fft(x);

% Finding LHS and RHS
LHS = sum(x.^2)
RHS = sum(abs(X).^2)/length(x)  %N = length(x)