clear all;
clc;
close all;

XK = [6, -5 + 11i, 0, -5 - 11i];
N = length(XK);
K = 0:N - 1;
CXK = conj(XK);
y = DIT_R2(CXK);
disp("Radix-2 DIT FFT method result")
y = conj(y) ./ 4;
y

Xvk=ifft(XK,N);
disp("Direct computation")
Xvk

k = 0:N - 1;
subplot(2, 2, 1)
stem(k, abs(y))
xlabel('n--->')
ylabel('|x(n)|--->')
title('Radix-2 DIT FFT Magnitude Plot')

subplot(2, 2, 2)
stem(k, angle(y))
xlabel('n--->')
ylabel('<(x(n))--->')
title(' Radix-2 DIT FFT Phase Plot')

subplot(2, 2, 3)
stem(k, abs(Xvk))
xlabel('n--->')
ylabel('|x(n))|--->')
title('Direct computation Magnitude plot')

subplot(2, 2, 4)
stem(k, angle(Xvk))
xlabel('n--->')
ylabel('<(x(n))--->')
title('Direct computation Phase plot')

function y = DIT_R2(x)
    p = nextpow2(length(x));
    x = [x zeros(1, (2^p) - length(x))];
    N = length(x);
    S = log2(N);
    Half = 1;
    x = bitrevorder(x);

    for stage = 1:S

        for index = 0:(2^stage):(N - 1)

            for n = 0:(Half - 1)
                pos = n + index + 1;
                pow = (2^(S - stage)) * n;
                w = exp((-1i) * (2 * pi) * pow / N);
                a = x(pos) + x(pos + Half) .* w;
                b = x(pos) - x(pos + Half) .* w;
                x(pos) = a;
                x(pos + Half) = b;
            end

        end

        Half = 2 * Half;
    end

    y = x;
end
