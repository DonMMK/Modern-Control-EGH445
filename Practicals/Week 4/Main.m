%% Non Linear Model
% Constants 
    Mc = 0.4; % kg
    m  = 0.15;% kg
    lm = 0.2; % m
    gm = 9.81;% m/s^2
Model_Constants = [Mc , m , lm , gm];


% Initial Condition
x0_a = [0 0 0 0];
x0_b = [0 pi 0 0];
x0 = x0_a;




%% Linear Model
% Pass the parameters to the matrices
Aa = [0 , 0 , 1 , 0; 
     0 , 0, 0 , 1;
     0 , (-gm*m)/Mc , 0 , 0];

Ba = [0 , 0 , 1/Mc , -1/(lm * Mc)];



Ca = eye(2 ,4);

Da = zeros(2,1);

Ab = [0 , 0 , 1, 0;
      0 , 0 , 0 ,1;
      0 , -gm/Mc , 0 , 0;
      0 , (-gm(Mc + m))/(lm * Mc) , 0 , 0];

Bb = [0 ;
      0 ;
      inv(Mc);
      inv(lm * Mc)];





xa_bar = [0 , 0 ,0 ,0 ]';
x0_a = [0.2 , (20*pi)/180 , 0 , 0]';



%% Out to Simulink Model

out = sim('Cart_Pendulum_Non_Linear');
out2 = sim('Cart_Pendulum_Linear');