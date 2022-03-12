% 1.2.2 Elementary math operations

x = 4/3;
y = x + 5;

% 1.2.3 Matrices

v = [1;2];
w = [1,2];

A = [1,2; 
    3,4];

A1 = A(:,1);

A2 = A(1,:);

B = 3*A;

C = [A B] % Append matrices

D = [A;B]

E = D(2:3 , :)

F = D(2:4 , 2)

% 1.2.4 Polynomials

p = [2 1 0 -3]

r = roots(p)

% 1.2.5 Graphical representation of results

x = [-10: 1 : 10];
y = x.^2;
plot(x , y) % Check also the command fplot

% 1.2.6 Writing Functions and Scripts





