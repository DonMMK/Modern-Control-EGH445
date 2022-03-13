%% This routine makes an animation of the quadrotor simulation.

clc;

disp('Animation started');

%% Declaration of auxiliar vectors


x1=qr_out.x+l*1.5*cos(qr_out.theta);
y1=qr_out.y+l*1.5*sin(qr_out.theta);

x2=qr_out.x-l*1.5*cos(qr_out.theta);
y2=qr_out.y-l*1.5*sin(qr_out.theta);


%% Allocation space movie
mov(1:length(qr_out.tout)) = struct('cdata',[],'colormap',[]);

%% Dimmension of the figure window for the movie

scrsz = get(0,'ScreenSize');
figmovie=figure('Name','Movie: Quadrotor Trajectory','Position',[scrsz(3)/5 scrsz(4)/10 scrsz(3)*3/5 scrsz(4)*8/10]);

%% We plot the current value and the static ones from the previous declaration.

for k=1:length(qr_out.tout)
    

figmovie;clf
title('xy-plane Trajectory','FontSize',18)
xlabel('x [m]','FontSize',18)
ylabel('y [m]','FontSize',18)
text(13,0.5,sprintf('Time %0.1f sec',qr_out.tout(k)),'FontSize',18)
hold on;
plot(qr_out.xref(1:k),qr_out.yref(1:k),'r--')
plot(qr_out.x(1:k),qr_out.y(1:k),'b')
plot(qr_out.xref(k),qr_out.yref(k),'ro','LineWidth',2);
line([x1(k),x2(k)],[y1(k),y2(k)],'LineWidth',6,'Marker','d','MarkerSize',8)
hold off
xlim([-1 15])
ylim([-1 15])
grid on;

%% Record data
mov(k) = getframe(gcf);
end

disp('Animation finished');

%% To save the animation, uncomment the following six command lines 

% vidObj = VideoWriter('QuadrotorTrajectory.avi');      % Create a video object
% vidObj.FrameRate = 10;                                % Set frames per second in video object
% open(vidObj);                                         % Open video object
% writeVideo(vidObj,mov);                               % Write the frames mov in video object
% close(vidObj)                                         % Close video object
% 
% disp('Animation finished - Saved in QuadrotorTrajectory.avi')

