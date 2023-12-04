clear;
clc;
close all;

T = [
1971 2250
1972 2500 
1974 5000 
1978 29000 
1982 120000 
1985 275000 
1989 1180000 
1993 3100000 
1997 7500000 
1999 24000000 
2000 42000000 
2002 220000000
2003 410000000 ];

A = zeros(size(T));
A(:,1) = 1;
A(:,2) = T(:,1) - 1970;
b = [log10(T(:,2))];
theta = A\b;
display(['theta 1 is ' , num2str(theta(1))]);
display(['theta 2 is ' , num2str(theta(2))]);
N_2015_In_Log = 10^(theta(1)+theta(2)*(2015-1970));
display(['The number of transistor in 2015 is ', num2str(N_2015_In_Log)]);