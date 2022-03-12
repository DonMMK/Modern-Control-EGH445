% Script to run the Mass Spring Damper

% Parameters
m = 1
k = 1 
b = 1;
 
x0 = [0,0]
stept = 1;
stepi = 2;
stepf = 10;

% State space matrices
A = [-b/m -k/m;
      1     0];
B =[ 1/m  ; 0]; 

% Output matrices y = Cx + Du
% C = [1 0;  % Make y = x
%       0 1];
% D = [0 ; 0];

out = sim('MassSpringDamperSystem')

% position, velocity, acceleration, external force, damper force and spring
acc = x_dot(:,1);
vel = x(:,1);
pos = x(:,2);



plot(out.mytime, out.x)
title('First-order differential equation')
xlabel('Time [s]')
ylabel('Variable x')