%% Plots

%% Positions and angle

figure(1)
subplot(3,1,1)
plot(qr_out.tout,qr_out.xref,'r',qr_out.tout,@@@,'b')
title('Position x [m]','FontSize',18)
legend('reference','actual')
grid on
subplot(3,1,2)
plot(qr_out.tout,qr_out.yref,'r',qr_out.tout,@@@,'b')
title('Position y [m]','FontSize',18)
legend('reference','actual')
grid on
subplot(3,1,3)
plot(qr_out.tout,qr_out.thetaref*(@@@),'r',qr_out.tout,qr_out.theta*(@@@),'b')
title('Angle [degree]','FontSize',18)
legend('reference','actual')
grid on

%% Front and Rear Forces

figure(2)
subplot(2,1,1)
plot(qr_out.tout,qr_out.FF)
title('Front Force [N]','FontSize',18)
grid on
subplot(2,1,2)
plot(qr_out.tout,qr_out.FR)
title('Rear Force [N]','FontSize',18)
grid on

%% Translational and rotational velocities

figure(3)
subplot(3,1,@@@)
plot(qr_out.tout,qr_out.vx)
title('Velocity dx/dt [m/s]','FontSize',18)
grid on
subplot(@@@,1,2)
plot(qr_out.tout,qr_out.vy)
title('Velocity dy/dt [m/s]','FontSize',18)
grid on
subplot(@@@,@@@,@@@)
plot(qr_out.tout,qr_out.vtheta)
title('Angular velocity [rad/s]','FontSize',18)
grid on

%% xy-plane Position of the quadrotor

figure(4)
plot(@@@,@@@,'r--',@@@,@@@)
legend('reference','actual')
xlabel('x [m]','FontSize',18)
ylabel('y [m]','FontSize',18)
title('xy-plane Trajectory','FontSize',18)
grid on