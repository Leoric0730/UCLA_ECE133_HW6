clear;
clc;
close all;
load('deblur.mat');
imshow(Y);
n = length(B);
E = zeros(n,n);
E(1,1) = 1; E(n,1) = -1;
lamda = [1e-6,1e-5,1e-4,1e-3,1e-2];
for i = 1:length(lamda)
figure();
lam = lamda(i);
D = abs(fft2(B)).^2 + lam*(abs(fft2(E)).^2 + abs(fft2(E')).^2);
x = ifft2(conj(fft2(B)).*(fft2(Y)./D));
imshow(x);
end 