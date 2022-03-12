function [a,w] = DotCrossProd(u,v)

% This functions takes two vectors in R^3 (columns) and computes their dot
% and cross products 

% Dot product 
a = u'*v;

% Cross Product
Sa = [0 -u(3) u(2)
    u(3)  0  -u(1)
    -u(2) u(1) 0];

w = Sa*v;