clc;
clear;
close all;

x = input('Input Sequence');
N = input('Enter the number of points');

len = length(x);
if N>len
    x = [x zeros(1,N-len)];
elseif N<len
        x=x(1:N);
end

i = sqrt(-1);
w = exp((-i*2*pi)/N);
n = 0:(N-1);
k= 0:(N-1);
nk = n'*k;
W = w.^nk;
X = x*W;

disp(X);
figure;
title('DFT')
subplot(2,1,1);
stem(k,abs(X));
title('Magnitude Spectrum');
xlabel('Discrete frequency');
ylabel('Amplitude');
grid on;
subplot(2,1,2);
stem(k,angle(X));
title('Phase Spectrum');
xlabel('Discrete Frequency');
ylabel('Phase angle');
grid on;
w2 = exp((-i *2 *pi)/N);
n = 0:(N-1);
k = 0:(N-1);
nk = n'*k;
W2=w2.^(-nk);
X = (X*W2)/N;
disp(X);
figure;
title('IDFT')
subplot(2,1,1);
stem(k,abs(x));
title('Magnitude Signal');
xlabel('N');
ylabel('Amplitude');
grid on;
subplot(2,1,2);
stem(k,angle(x));
title('Phase Plot');
xlabel('N');
ylabel('Phase Angle');
grid on;
