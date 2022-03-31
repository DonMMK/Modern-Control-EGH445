% Constants 
    Mc = 0.4; % kg
    m  = 0.15;% kg
    lm = 0.2; % m
    gm = 9.81;% m/s^2
Model_Constants = [Mc , m , lm , g]


% Initial Condition
x0_a = [0 0 0 0];
x0_b = [0 pi 0 0];
x0;

out = sim('Cart_Pendulum_Non_Linear');