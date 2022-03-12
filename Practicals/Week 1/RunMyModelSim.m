% Script to run the mymodel_sim

tau=0.5;
x0=0;
stept=1;
stepi=0;
stepf=10;
out = sim('mymodel')
plot(out.mytime, out.x)
title('First-order differential equation')
xlabel('Time [s]')
ylabel('Variable x')