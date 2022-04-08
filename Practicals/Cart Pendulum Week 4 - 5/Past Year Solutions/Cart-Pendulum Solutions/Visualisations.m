function [fig_handle] = Visualisations(sim_objects,labels,linestyles)
%VISUALISATIONS Summary of this function goes here
%   Detailed explanation goes here

fig_handle = figure();

for idx = 1:length(sim_objects)
    
    suffix = char(labels(idx));
    linestyle = char(linestyles(idx));
    
    % Control Force
    subplot(3,2,1:2)
    hold on
    plot(sim_objects(idx).tout,sim_objects(idx).F,'DisplayName',sprintf('F %s',suffix),'LineWidth',2,'LineStyle',linestyle)
    if idx == length(sim_objects)
        legend()
        xlabel('Time [s]')
        ylabel('Control Force [N]')
        grid on
    end
    hold off
    
    % Linear Position
    subplot(3,2,3)
    hold on
    plot(sim_objects(idx).tout,sim_objects(idx).x(:,1),'DisplayName',sprintf('x_1 %s',suffix),'LineWidth',2,'LineStyle',linestyle)
    plot(sim_objects(idx).tout,sim_objects(idx).x_hat(:,1),'DisplayName',sprintf('x_1 hat %s',suffix),'LineWidth',2,'LineStyle',linestyle)
    if idx == length(sim_objects)
        legend()
        xlabel('Time [s]')
        ylabel('Cart position [m]')
        grid on
    end
    hold off

    % Angular Position
    subplot(3,2,4)
    hold on
    plot(sim_objects(idx).tout,sim_objects(idx).x(:,2)*(180/pi),'DisplayName',sprintf('x_2 %s',suffix),'LineWidth',2,'LineStyle',linestyle)
    plot(sim_objects(idx).tout,sim_objects(idx).x_hat(:,2)*(180/pi),'DisplayName',sprintf('x_2 hat %s',suffix),'LineWidth',2,'LineStyle',linestyle)
    if idx == length(sim_objects)
        legend()
        xlabel('Time [s]')
        ylabel('Pendulum angle [deg]')
        grid on
    end
    hold off

    % Linear Velocity
    subplot(3,2,5)
    hold on
    plot(sim_objects(idx).tout,sim_objects(idx).x(:,3),'DisplayName',sprintf('x_3 %s',suffix),'LineWidth',2,'LineStyle',linestyle)
    plot(sim_objects(idx).tout,sim_objects(idx).x_hat(:,3),'DisplayName',sprintf('x_3 hat %s',suffix),'LineWidth',2,'LineStyle',linestyle)
    if idx == length(sim_objects)
        legend()
        xlabel('Time [s]')
        ylabel('Cart velocity [m/s]')
        grid on
    end
    hold off
    
    % Angular Velocity
    subplot(3,2,6)
    hold on
    plot(sim_objects(idx).tout,sim_objects(idx).x(:,4)*(180/pi),'DisplayName',sprintf('x_4 %s',suffix),'LineWidth',2,'LineStyle',linestyle)
    plot(sim_objects(idx).tout,sim_objects(idx).x_hat(:,4)*(180/pi),'DisplayName',sprintf('x_4 hat %s',suffix),'LineWidth',2,'LineStyle',linestyle)
    if idx == length(sim_objects)
        legend()
        xlabel('Time [s]')
        ylabel('Pendulum rate [deg/s]')
        grid on
    end
    hold off
    
end


end

