clc
close all
clear all

%% Matlab Exercises
A = [0    2 -8;
     3    5  4;
    -1.5 -1  1];

B = [4   4  0;
     1   4  0;
    -1  -2  2];

v = A(:,1);
w = B(:,1);

Part1 = v'*w;

Part2a = abs(v);
Part2b = abs(w);

Part3a = A\B;
Part3b = A/B; %A*(1\B);

Part4a = inv(A) * B;
Part4b = A * inv(B); 

% Using matlab functions
det(B);
rank(B);
trace(B);
eig(B);
[V , D] = eig(B);

p = [a b 0];
