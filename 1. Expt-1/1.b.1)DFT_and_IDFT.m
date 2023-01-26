clc;
clear all;
close all;

%Variables declaration and initialization:
x=[0,1,2,1];
N=length(x);
X=zeros(N,1);

%Array indexing starts from 1 in matlab.
% 1. DFT:
for k = 0:(N-1)
    for n = 0:(N-1)
        X(k+1) = X(k+1)+x(n+1)*exp(-j*2*pi*n*k/N);
    end    
end
disp('DFT is: ');
X

n=0:N-1;

subplot(411)
stem(n,x)
title("Input discrete signal:")

% grid on;
subplot(412)
stem(n,abs(X))
title("Magnitude response of DFT:")

subplot(413)
stem(n,angle(X))
title("Phase response of DFT:")

%----------------------------------------------------------------------------
% 2. IDFT:
y=zeros(N,1);
for n = 0:(N-1)
    for k = 0:(N-1)
        y(n+1)=y(n+1)+X(k+1)*(1/N)*exp(j*2*pi*n*k/N);
    end
end
disp('IDFT is: ')
y
subplot(414)
stem(abs(y))
title("IDFT of X(k)")
