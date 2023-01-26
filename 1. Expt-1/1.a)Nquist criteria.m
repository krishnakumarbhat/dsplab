% sine wave generation:
f=2;
t=0:0.0001:1;
y=sin(2*pi*f*t);
subplot(311)
plot(t,y)
xlabel("Time")
ylabel("Amplitude")
title("Sine wave")

% Sampling
fs=12;
ts=1/fs;
n=0:ts/f:1;
y_sampled=sin(2*pi*f*n)
subplot(312)
stem(n, y_sampled)
xlabel("Time")
ylabel("Amplitude")
title("Sampled signal")

% Reconstructuring signal
new_query_points = linspace(0,1,1000);
new_y = interp1(n,y_sampled,new_query_points);
subplot(313)
plot(n,y_sampled,'ro',new_query_points,new_y);