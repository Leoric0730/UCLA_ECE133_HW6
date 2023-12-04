clc;
close all;
clear;

n = 10000;
a = randn(n, 1);
b = randn(n, 1);
A = toeplitz(a, [a(1), flipud(a(2:n))']);
tic;
x1 = A\b; 
elapsed_time_1 = toc;
disp(['Elapsed time for A\b: ', num2str(elapsed_time_1), ' seconds']);

tic;
x2 = ifft(fft(b)./fft(a));
elapsed_time_2 = toc;
disp(['Elapsed time for fast algorithmn: ', num2str(elapsed_time_2), ' seconds']);
