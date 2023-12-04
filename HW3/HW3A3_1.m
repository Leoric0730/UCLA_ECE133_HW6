clc
close all 
clear

figure;
grid on; 
func_x = linspace(-1,1,1000);      % This is the x axis of the function
func_y = 1 ./ (1 + 25*func_x.^2);
plot(func_x,func_y,':','Color','b','LineWidth',1.5);      % Plot the function out first
legend('original function');
hold on;

degree_vec = [6,11,16];
for i = 1:length(degree_vec)
    t = linspace(-1, 1, degree_vec(i))';
    y = 1 ./ (1 + 25*t.^2); % b matrix
    T = vander(t);
    A = fliplr(T);      % A matrix
    x = A\y;            % X vectors contain all the coefficients
    x_vec = flipud(x);
    y_values = polyval(x_vec, t);
    plot(t, y_values, 'LineWidth', 1, 'DisplayName', ['degree ' num2str(degree_vec(i))]);
    grid on
end