% Script to run the Mass Spring Damper 
 
%% Parameters Set 1
m = 1;
c = 1; 
b = 1;

%% Parameters Set 2
m = 1;
c = 1; 
b = 100;

%% -
stept = 1;
stepf = 10;
stepi = 2;
x0 = [0,0]


% State space matrices
A = [0 1;
      -1/(c*m)  -b/m];
B =[ 0  ; 1/m]; 

% Output matrices y = Cx + Du
C = [1 0;  % Make y = x
      0 1];
D = [0 ; 0];

out = sim('MassSpringDamperSys') % Change out for both methods and check

% position, velocity, acceleration, external force, damper force and spring
acc = x_dot(:,1);
vel = x(:,1);
pos = x(:,2);



plot(out.mytime, out.x)
title('First-order differential equation')
xlabel('Time [s]')
ylabel('Variable x')