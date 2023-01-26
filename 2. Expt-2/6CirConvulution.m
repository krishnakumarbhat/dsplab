clc
clear all
close all

x1 = [1,2,3,1];
x2 = [4,3,2,2];
if length(x1)>length(x2)
    N = length(x1)
else
    N = length(x2)
end

% Making length of 2 sequences equal
x1 = [x1 zeros(1,N-length(x1))]
x2 = [x2 zeros(1,N-length(x2))]

% Calculating DFTs of 2 sequences
X1 = fft(x1);
X2 = fft(x2);

% Calculating circular convolution
cirCon = ifft(X1.*X2)
stem(cirCon)
ylabel('Amplitude ---->')
xlabel('n ---->')