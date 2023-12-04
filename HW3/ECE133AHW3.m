% Define the coefficients of the polynomial (in descending order)
coefficients = [1, -3,0];  % Represents the polynomial x^2 - 3x + 2

% Generate x values for the plot
x_values = linspace(-2, 4, 100);  % Adjust the range as needed

% Evaluate the polynomial for each x value
y_values = polyval(coefficients, x_values);

% Plot the polynomial
plot(x_values, y_values, 'LineWidth', 2);
title('Plot of the Polynomial');
xlabel('x');
ylabel('y');
grid on;
