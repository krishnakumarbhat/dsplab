%If DFT{x(n)} = X(k), then
%DFT{x(-n)} = X*(k)
clc;
close all;
clear all;

xn=[2,3,5,7];
N=length(xn);
Xk=fft(xn);
disp('dft of the sequence x(n) ie X(k)');
disp(Xk);

n=0:N-1;
x1n=xn(mod(-n,N)+1); %Time reversing original sequence
disp('time reversed sequence x(-n)');
disp(x1n);

X1k=fft(x1n);
disp('dft of time reversed sequence');
disp(X1k);

X2k=conj(Xk);
disp('conjugate of X(k)');
disp(X2k);

%Plotting
figure("Name","new");
subplot(421);
stem(xn);
title("Input Signal");
ylabel("x(n)"); xlabel("n ---->");

subplot(422);
stem(x1n);
title("Time Reversed Input Signal");
ylabel("x(-n)"); xlabel("n ---->");


subplot(423);
stem(abs(Xk));
ylabel('|X(K)|');
xlabel('K ---->');
title('magnitude of dft{x(n)}');

subplot(424);
stem(angle(Xk));
ylabel('<X(K)');
xlabel('K ---->');
title('phase of dft of x(n)');

subplot(425);
stem(abs(X2k));
ylabel('Amplitude ---->');
xlabel('K ---->');
title('magnitude of conjugate of X(k)');

subplot(426);
stem(angle(X2k));
ylabel('Angle ---->');
xlabel('K ---->');
title('phase of conjugate of X(k)');

subplot(427);
stem(abs(X1k));
ylabel('Amplitude ---->');
xlabel('K ---->');
title('magnitude of dft of x(-n)');

subplot(428);
stem(angle(X1k));
ylabel('Angle ---->');
xlabel('K ---->');
title('phase of dft of x(-n)');