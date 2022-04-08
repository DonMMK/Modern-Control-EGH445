%% EGH445 Lab 4 - Cart Pendulum Model
% J. Mount | QUT 2020

clearvars;
close all;
clc;

%% Model Parameters

g=9.81;
l=0.2;
m=0.15;
Mc=0.4;

xa_bar = [0, 0, 0, 0];
xb_bar = [0, pi, 0, 0];

%% Simulation Parameters

controller_enabled = 1;     % set to 1 to enable the controller
use_state_estimates = 0;    % set to 0 to enable the observer
stop_time = 5;
step_time = 0.02;

%% Initial Conditions

% Linear A
initial_conditions_a = [0.2, 20*pi/180.0, 0, 0];

% Linear B
initial_conditions_b = [0.4, 200*pi/180.0, 0, 0];


%% Linear Simulation - Equilibrium A

% Matrices
A = zeros(4);
A(1,3) = 1;
A(2,4) = 1;
A(3,2) = -g*m/Mc;
A(4,2) = g*(Mc+m)/(l*Mc);

B = [0; 0; 1/Mc; -1/(l*Mc)];

C = [1, 0, 0, 0; 0, 1, 0, 0];
D = zeros(2,1);

% Controller Design
contA = ctrb(A,B);
rank_contA = rank(contA);
if rank_contA ~= length(B)
    error('The equilibrium point A is not controllable. Rank of the Controllability matrix is %d',rank_contA);
else
    fprintf('Equilibrium Point A is Controllable\n')
end

desiredPoles = [-3, -4, -5, -6];
K_cont = place(A, B, desiredPoles);

% Observer Design
obsvA = obsv(A,C);
rank_obsvA = rank(obsvA);
if rank_contA ~= length(B)
    error('The equilibrium point A is not Observable. Rank of the Observability matrix is %d',rank_contA);
else
    fprintf('Equilibrium Point A is Observable\n')
end

desiredPoles = [-63, -64, -65, -66];
L_obsv = place(A', C', desiredPoles)';

% Initial Conditions
initial_conditions_linear = initial_conditions_a - xa_bar;

% Simulation
simout_linA = sim('Cart_Pendulum_Linear_Tutor', 'Solver', 'ode4', 'StopTime', 'stop_time', 'FixedStep', 'step_time');
% Visualisations([simout_linA], {'Linear A'}, {'--'});

%% Non-Linear Simulation

initial_conditions = initial_conditions_a;
x_bar = xa_bar;
simout_nl = sim('Cart_Pendulum_NonLinear_Tutor', 'Solver', 'ode4', 'StopTime', 'stop_time', 'FixedStep', 'step_time');    % Simulation of the nonlinear closed loop


%% Visualisations

fig1 = Visualisations([simout_nl, simout_linA], {'Non-Linear', 'Linear A'}, {'-', '--'});
sgtitle('Design Using Linearisation About EP-A (No Damping)');
% Cart_Pendulum_Animation(simout_nl.tout, simout_nl.x(:,1), simout_nl.x(:,2), x_ref(1), x_ref(2));


%% Linear Simulation - Equilibrium B

A = zeros(4);
A(1,3) = 1;
A(2,4) = 1;
A(3,2) = -g*m/Mc;
A(4,2) = -g*(Mc+m)/(l*Mc);

B = [0; 0; 1/Mc; 1/(l*Mc)];

C = [1, 0, 0, 0; 0, 1, 0, 0];
D = zeros(2,1);

% Controller Design
contB = ctrb(A,B);
rank_contB = rank(contB);
if rank_contB ~= length(B)
    error('The equilibrium point B is not controllable. Rank of the Controllability matrix is %d',rank_contB);
else
    fprintf('Equilibrium Point B is Controllable\n')
end

desiredPoles = [-3, -4, -5, -6];
K_cont = place(A, B, desiredPoles);

% Observer Design
obsvB = obsv(A,C);
rank_obsvB = rank(obsvB);
if rank_obsvB ~= length(B)
    error('The equilibrium point B is not Observable. Rank of the Observability matrix is %d',rank_obsvB);
else
    fprintf('Equilibrium Point B is Observable\n')
end

desiredPoles = [-63, -64, -65, -66];
L_obsv = place(A', C', desiredPoles)';

% Initial Conditions
initial_conditions_linear = initial_conditions_b - xb_bar;

% Simulation
simout_linB = sim('Cart_Pendulum_Linear_Tutor', 'Solver', 'ode4', 'StopTime', 'stop_time', 'FixedStep', 'step_time');


%% Non-Linear Simulation

initial_conditions = initial_conditions_b;
x_bar = xb_bar;
simout_nl = sim('Cart_Pendulum_NonLinear_Tutor', 'Solver', 'ode4', 'StopTime', 'stop_time', 'FixedStep', 'step_time');    % Simulation of the nonlinear closed loop


%% Visualisations

fig2 = Visualisations([simout_nl, simout_linB], {'Non-Linear', 'Linear B'}, {'-', '--'});
sgtitle('Design Using Linearisation About EP-B (No Damping)');
% Cart_Pendulum_Animation(simout_nl.tout, simout_nl.x(:,1), simout_nl.x(:,2), xref(1), xref(2));
    

