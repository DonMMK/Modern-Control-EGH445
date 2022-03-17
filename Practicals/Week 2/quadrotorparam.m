%% Quadrotor parameters
m= 0.5; % kg
J= 0.0112; %Kg m^2
bt=1;   % Nms
g= 9.8; % ms^-2
l=0.2;  % m
lf=0.2; % m
lr=0.2; % m

%% Set initial conditions for generalised displacements and momenta to zero

cipx=0;
cipy=0;
ciLtheta=0;
cix=0;
ciy=0;
citheta=0;

%% reference signals

xref=10;
txref=1;

yref=10;
tyref=1;

SteptTc=20;                 % Time for the reference to move in a circular path

Acx=4;                      % Radius of the circular path
Tcx=30;                     % Period of one revolution

Acy=4;                      % Radius of the circular path
Tcy=30;                     % Period of one revolution

SteptOff=80;                % Time to drive the reference to zero 


%% Controller

kx=.5;
ky=.5;
kt=5;
kvx=.1;
kvy=1;
kvt=5;

