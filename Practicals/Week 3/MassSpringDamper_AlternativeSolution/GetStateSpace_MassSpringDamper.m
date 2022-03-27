function [msd] = GetStateSpace_MassSpringDamper(msd)
%GetStateSpace_MassSpringDamper Gets the state space matrices given a the
%parameters of a mass-spring-damper system (stored as a struct)
%
%   Input: msd - struct containing the parameters of a mass-spring-damper
%   system stored in fields m, c and b respectively.
%
%   Output: an updated struct containing the state space matrices (A, B, C
%   and D), the eigen values of A, the simulation stop time and simulation
%   step size which are both based on the eigen values.
%
%   Example Usage: 
%       msd.m = 1;
%       msd.c = 1;
%       msd.b = 1;
%       msd = GetStateSpace_MassSpringDamper(msd);


%% State Space Matrices
msd.A = [0, 1;
    -1/(msd.c*msd.m), -msd.b/msd.m];

msd.B = [0, 1/msd.m]';
msd.C = eye(2);
msd.D = zeros(2,1);

%% Eigenvalues and Simulation Time Parameters
% time_constant = 1/real_part_pole
% stop_time = 5 * time_constant of slowest pole
% time_step = time_constant/10 of fastest pole

% Eigen Values
msd.eig = eig(msd.A); % eigen values represent the poles of the system

% Simulation Time Parameters 
msd.stop_time = abs(5*(1/max(real(msd.eig))));
msd.time_step = abs((1/10)*(1/min(real(msd.eig))));

end

