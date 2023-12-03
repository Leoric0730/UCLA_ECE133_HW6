clear;
clc;
close all;
F = [1,1;
     0,0.95];
g = [0;
     0.1];
G = [1,1;
     0,0.8];
q = [0;
     0.2];
H = zeros(2,20);
A = zeros(1,20); % Use for filling 0 entries in 
for i=20:-1:1
    H(:,i) = F^(20-i)*g; 
end
H_hat = zeros(2,20);
for i=20:-1:1
    H_hat(:,i) = G^(20-i)*q;
end
C = [H(1,:), -H_hat(1,:);
     H(2,:),A;
     A,H_hat(2,:)];
d = [1;0;0];
x = C'*((C*C')\d);
display(x);