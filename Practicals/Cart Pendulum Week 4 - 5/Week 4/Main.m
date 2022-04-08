%% Model Parameters
% Constants 
    Mc = 0.4; % kg
    m  = 0.15;% kg
    lm = 0.2; % m
    gm = 9.81;% m/s^2
    b = 1; % Damping coefficent , replace as zero if no damping
Model_Constants = [Mc , m , lm , gm];


%% Simulation Parameters

start_time = 0;
stop_time = 5;
step_time = 0.02;


%% Initial Conditions

% For Linear Model Eq Point A
x0_a = [0 0 0 0];
x0 = x0_a;
xa_bar = [0 0 0 0]';

% For Linear Model Eq Point b
x0_b = [0 pi 0 0];

%% Choose Linear System

%% Linear Model - Equilibrium A
% Pass the parameters to the matrices

% No damping
Aa = [0 , 0 , 1 , 0; 
     0 , 0, 0 , 1;
     0 , (-gm*m)/Mc , 0 , 0;
     0 gm*(Mc+m)/(1+Mc) 0 0];
 
% With damping
Aa = [0 , 0 , 1 , 0; 
     0 , 0, 0 , 1;
     0 , (-gm*m)/Mc , -b/Mc , 0;
      0 gm*(Mc+m)/(1+Mc) -b/(Mc*1) 0];

Ba = [0 , 0 , 1/Mc , -1/(lm * Mc)];

Ca = eye(2 ,4);

Da = zeros(2,1);

%% Non-Linear Simulation



%% Linear Model - Equilibrium B
% No damping
Ab = [0 , 0 , 1, 0;
      0 , 0 , 0 ,1;
      0 , -m*gm/Mc , 0 , 0;
      0 , (-gm*(Mc + m))/(1 * Mc) , 0 , 0];
 
% With damping
Ab = [0 , 0 , 1, 0;
      0 , 0 , 0 ,1;
      0 , -m*gm/Mc , -b/Mc , 0;
      0 , (-gm*(Mc + m))/(1 * Mc) , -b/(Mc*1) , 0];

Bb = [0 ;
      0 ;
      inv(Mc);
      inv(lm * Mc)];


xa_bar = [0 , 0 ,0 ,0 ]';
x0_a = [0.2 , (20*pi)/180 , 0 , 0]';


%% Non-Linear Simulation



%% Out to Simulink Model

out = sim('Cart_Pendulum_Non_Linear');
out2 = sim('Cart_Pendulum_Linear');


