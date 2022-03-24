%% 3.3 Eigenvalues and Integration steps

% ctrb(A,B)- computes the controllability matrix
% ctrb(Sys)- computes the controllability matrix, Sys is a system object (created with ss or tf)
% rank(A) - computes the rank of a matrix
% det(A) - computes the determinant
% poly(A) - computes the characteristic polynomial when A is a square matrix.
% poly(v) - if v is a vector, poly(v) computes the coefficients of a polynomial whose roots are the elements of v
% roots(v) - if v is a vector interpreted as coefficients of a polynomial, roots(v) return its roots

% Part A
%% Parameters Set 1
m = 1;
c = 1; 
b = 1;

A = [0 1;
      -1/(c*m)  -b/m];
Eigenvalue_A_set1 = eig(A)

%% Parameters Set 2
m = 1;
c = 1; 
b = 100;

A = [0 1;
      -1/(c*m)  -b/m];
Eigenvalue_A_set2 = eig(A)

%% Part B

%% Part C