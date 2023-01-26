clc;
close all;
clear all;
fs = 2000;
n = input("Enter length");
choice = input("Select An option for which Filter Type\n1. Low pass filter\n2. High pass \n");
Wc = input('Enter the Cuttoff Frequency: ');
Wc = Wc / (fs / 2);

switch choice
    case 1
        ans = fir1(n, Wc, "low", hann(n + 1));
        freqz(ans, 1, 1024);
    case 2
        ans = fir1(n, Wc, "high", hann(n + 1));
        freqz(ans, 1, 1024);
    end
