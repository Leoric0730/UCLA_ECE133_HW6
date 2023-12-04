clc
close all 
clear

figure;
grid on; 

A = [1,1,1,-3,-3;
    1,2,4,-10,-20;
    1,3,9,-30,-90;
    1,4,16,8,32;
    1,5,25,15,75;
    ];
b = [3,5,10,-2,-3]';
theta =  A\b;

t = linspace(-10, 10, 1000); 
y = (theta(1)+theta(2)*t+theta(3)*t.^2)./(1+theta(4)*t+theta(5)*t.^2);
plot(t,y);
