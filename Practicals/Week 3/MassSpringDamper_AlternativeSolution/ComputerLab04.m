%% EGH445 Computer Lab 4
% Created 7 Aug 2020 - J. Mount

close all;
clear;
clc;

%% Mass-Spring-Damper System - State Space and Parameters


% Parameter Set 1 - using struct to contain values
MSD_1.m = 1;    % Mass [kg]
MSD_1.c = 1;    % Spring constant [m/N]
MSD_1.b = 1;    % Damping coefficient [Ns/m]

MSD_1 = GetStateSpace_MassSpringDamper(MSD_1);

% Parameter Set 2 - using struct to contain values
MSD_2.m = 1;
MSD_2.c = 1;
MSD_2.b = 100;

MSD_2 = GetStateSpace_MassSpringDamper(MSD_2);

% Input Parameters
input.step_time = 1;
input.final_value = 1;

%% Accuracy of Solvers - Parameter Set 1

A = MSD_1.A;
B = MSD_1.B;
C = MSD_1.C;
D = MSD_1.D;
step_times = [0.01, 0.1, 1, 2];

% Simulations
subplot_idx = 1;
for deltaT = step_times
    % Euler Method - ode1
    ode1 = sim('MassSpringDamper_Model', 'Solver', 'ode1', 'FixedStep', 'deltaT', 'StopTime', 'MSD_1.stop_time');
    % The 'FixedStep', 'deltaT' means set the FixedStep parameter to the
    % string deltaT, then Simulink will look for the deltaT variable in our
    % workspace. Similar thing applies for the 'StopTime' parameter. You
    % can also pass through 'FixedStep', '0.01' to specify a value directly
    % rather than a value stored in a variable.
    
    % Runge-Kutta Method - ode4
    ode4 = sim('MassSpringDamper_Model', 'Solver', 'ode4', 'FixedStep', 'deltaT', 'StopTime', 'MSD_1.stop_time');
    
    % Visualisation
    figure(1);
    subplot(2,2,subplot_idx);
    plot(ode1.tout, ode1.x1, 'b', ode4.tout, ode4.x1, 'r--');
    legend('ODE1', 'ODE4');
    title({'Mass-Spring-Damper - Parameter Set 1', sprintf('Integration Step = %0.2fs',deltaT)});
    xlabel('Time (sec)');
    ylabel('Position (m)');
    
    figure(2);
    subplot(2,2,subplot_idx);
    plot(ode1.tout, ode1.x2, 'b', ode4.tout, ode4.x2, 'r--');
    legend('ODE1', 'ODE4');
    title({'Mass-Spring-Damper - Parameter Set 1', sprintf('Integration Step = %0.2fs',deltaT)});
    xlabel('Time (sec)');
    ylabel('Velocity (m/s)');
    
    % Increase subplot index
    subplot_idx = subplot_idx + 1;
end


%% Simulation Time of Solvers - Parameter Set 2

A = MSD_2.A;
B = MSD_2.B;
C = MSD_2.C;
D = MSD_1.D;

% Runge-Kutta - Fixed Time - ode4
tstart = tic;
ode4 = sim('MassSpringDamper_Model', 'Solver', 'ode4', 'FixedStep', 'MSD_2.time_step', 'StopTime', 'MSD_2.stop_time');
ode4_runtime = toc(tstart);
t_ode4 = ode4.get('tout');

% Variable Time - ode45
tstart = tic;
ode45 = sim('MassSpringDamper_Model', 'Solver', 'ode45', 'StopTime', 'MSD_2.stop_time');
ode45_runtime = toc(tstart);

% Variable Time - ode15s
tstart = tic;
ode15s = sim('MassSpringDamper_Model', 'Solver', 'ode15s', 'StopTime', 'MSD_2.stop_time');
ode15s_runtime = toc(tstart);

% Figures
figure(3);
subplot(2,1,1)
plot(ode4.tout,ode4.x1,'b', ode45.tout,ode45.x1, 'r--', ode15s.tout,ode15s.x1,'g--');
legend('ODE4', 'ODE45', 'ODE15S');
title('Mass-Spring-Damper - Parameter Set 2');
xlabel('Time (sec)');
ylabel('Position (m/s)');

subplot(2,1,2)
plot(ode4.tout,ode4.x2,'b', ode45.tout,ode45.x2, 'r--', ode15s.tout,ode15s.x2,'g--');
legend('ODE4', 'ODE45', 'ODE15S');
title('Mass-Spring-Damper - Parameter Set 2');
xlabel('Time (sec)');
ylabel('Velocity (m/s)');

figure(4)
subplot(2,2,1);
plot(ode4.tout(1:end-1), diff(ode4.tout), 'b-');
title('Mass-Spring-Damper - Parameter Set 2 - ODE4');
xlabel('Simulation Time (sec)');
ylabel('Time Step (sec)');
xlim([0, MSD_2.stop_time]);
ylim([0, 2*MSD_2.time_step]);

subplot(2,2,2);
plot(ode45.tout(1:end-1), diff(ode45.tout), 'r-');
title('Mass-Spring-Damper - Parameter Set 2 - ODE45');
xlabel('Simulation Time (sec)');
ylabel('Time Step (sec)');
xlim([0, MSD_2.stop_time]);

subplot(2,2,3);
plot(ode15s.tout(1:end-1), diff(ode15s.tout), 'g-');
title('Mass-Spring-Damper - Parameter Set 2 - ODE15s');
xlabel('Simulation Time (sec)');
ylabel('Time Step (sec)');
xlim([0, MSD_2.stop_time]);

subplot(2,2,4);
bar([ode4_runtime, ode45_runtime, ode15s_runtime]);
xticklabels({'ode4', 'ode45', 'ode15s'});
title('Mass-Spring-Damper - Parameter Set 2 - Run Times');
ylabel('Simulation Time (sec)');



    





