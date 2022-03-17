%% EGH445 Computer Lab
% Solutions - Introduction to Matlab and Simulink
close all;
clc;

%% Section 1.2.7 Exercises (Matlab Basics)

% Setup v and w column vectors, matrices A and B, as well as scalars a and
% b
v = [0 1 1]';
w = [1 0 0]';

A = [0 2 -8;
    3 5 4;
    -1.5 -1 1];

B = [4 4 0;
    1 4 0;
    -1 -2 2];

a = -1;
b = 25;

% Dot Product
res = dot(v,w);

% Norms
nV = norm(v);
nW = norm(w);

% Inverses
iAB = A\B; % equivalent to: iAB = inv(A)*B 
ABi = A/B; % equivalent to: ABi = A*inv(B)

% Inverse Product
i_AB = inv(A*B);

% B properties
detB = det(B);
rankB = rank(B);
traceB = trace(B);
[eVectorMatrix, eVals] = eig(B);
% Unwrap eigenvalues values from the diagonal matrix
eVal1 = eVals(1,1);
eVal2 = eVals(2,2);
eVal3 = eVals(3,3);
% Unwrap eigenvectors from the columns of this matrix
eVec1 = eVectorMatrix(:,1);
eVec2 = eVectorMatrix(:,2);
eVec3 = eVectorMatrix(:,3);

% Roots
x = roots([a b 0]);
x1 = x(1);
x2 = x(2);


%% Section 1.3.1 Exercises (Simulink Basics)
% Simulink model is called mymodel.slx

% Run the model from Simulink and double-click on the scope to see the
% results. After you have run the simulation, via Simulink, run this
% section of code to plot the results via Matlab.

if exist('out', 'var') == 0
    errordlg('Make sure you have run the "mymodel" Simulink model prior to running this section');
    return
end

figure(1)
plot(out.mytime, out.x);
xlabel('Time (s)');
ylabel('Variable x');
title('First Order ODE in Simulink');


%% Section 1.4.3 Exercises (Running Simulink from Matlab)
% Simulink model is called mymodel_sim.slx

% Setup Simulink Model Parameters
tau = 0.5;  % tau
x0 = 0;     % initial conditions
stept = 1;  % step time
stepi = 0;  % initial value of step function
stepf = 10; % final value of step function

% Run Simulink Model
out_1 = sim('mymodel_sim');

figure(2)
plot(out_1.mytime, out_1.x);
xlabel('Time (s)');
ylabel('Variable x');
title('First Order ODE (called from MATLAB)');


%% Section 1.5.2 Exercises (Mass-Spring-Damper)
% Simulink model is called msd_model.slx

% Setup Simulink Model Parameters
m = 1;      % mass
k = 1;      % spring constant
b = 1;      % damping coefficient
stept = 2;  % step time
stepi = 0;  % external force before step time 
stepf = 1;  % external force after step time
x0 = 0;     % initial condition for position
vel0 = 0;   % initial condition for velocity

% Run Simulink Model
msd_sim = sim('msd_model');

figure(3)
plot(msd_sim.mytime, msd_sim.pos, 'DisplayName', 'Position');
hold on
plot(msd_sim.mytime, msd_sim.vel, 'DisplayName', 'Velocity');
plot(msd_sim.mytime, msd_sim.acc, 'DisplayName', 'Acceleration');
xlabel('Time (s)');
ylabel('Amplitude (m, m/s, m/s/s)');
title('Mass-Spring-Damper System');
legend();

figure(4)
plot(msd_sim.mytime, msd_sim.force, 'DisplayName', 'External Force');
hold on
plot(msd_sim.mytime, -b*msd_sim.vel, 'DisplayName', 'Damper Force');
plot(msd_sim.mytime, -k*msd_sim.pos, 'DisplayName', 'Spring Force');
xlabel('Time (s)');
ylabel('Force (N)');
title('Mass-Spring-Damper System Forces');
legend();




