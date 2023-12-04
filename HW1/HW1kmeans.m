% Housekeeping...
clear;
clc;
close all;

% Initialization and constant declaration
k = 20;
error_tol = 1e-5;
N = 10000;
z = zeros(784,20);
load mnist_train.mat
load class.mat
digits = digits(:, 1:10000);
X = reshape(digits(:,1), 28, 28);
%imshow(X);
group = class; %randi(20, 1, 10000);
for i = 1:20
    I = find(group == i);
    subM = digits(:,I);
    repI = mean(subM,2);
    z(:,i) = repI;
end

sum = 0;
for j = 1:N
    sum = sum + norm(digits(:,j)-z(:,group(j)))^2;
end
J = 1/N*sum;
Jprev = J;

% Now begins the while loop until error between loops is within desired value
while true
% Assign each vector to its nearest representitive.
    sum = 0;
    for q = 1:N 
        dis = zeros(1,20);
        for p = 1:length(dis)
            dis(p) = norm(digits(:,q)-z(:,p));
        end
        minValue = min(dis);
        index_of_min = find(dis == minValue, 1, 'first');
        group(q) = index_of_min;
        sum = sum + norm(digits(:,q)-z(:,group(q)))^2;
    end

% Calculate new J value
    J = 1/N*sum;
    if abs(J-Jprev)/J <= 1e-5
        break;
    end
    Jprev = J;

% Update representitives
    for ii = 1:k
        II = find(group == ii);
        rep = mean(digits(:,II),2);
        z(:,ii) = rep;
    end
end
% Show the final representitives' figures
for k=1:20
    subplot(4,5,k)
    imshow(reshape(z(:,k), 28, 28));
end