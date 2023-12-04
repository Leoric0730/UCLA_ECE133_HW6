clc
clear
close all
format long

k = [6,7,8];
x = [];
y = [];
for i = 1:length(k)
    A = [1,1;
        10^(-k(i)), 0;
        0, 10^(-k(i))];
    b = [-10^(-k(i));
        1 + 10^(-k(i));
        1 - 10^(-k(i))];
    format long
    x(:,i) = A\b;
    y(:,i) = (A'*A)\(A'*b);
end 