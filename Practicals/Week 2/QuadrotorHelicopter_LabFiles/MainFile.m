%% MainFile

%% Load model and controller parameters

quadrotorparam


%% Simulation

tStart=0;
tFinal=110;
outputsample=0.25;

qr_out = sim('QuadrotorVertPlane',[tStart tFinal]);


%% Visualization of results

plots

%% Animation

quadrotoranimation