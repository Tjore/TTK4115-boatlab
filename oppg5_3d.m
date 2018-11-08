%% oppg 5.3 b

%% init
% getting some variables from 5.3.a
run oppg5_3.m
close all

%% running simulation

sim("ship_5_3_d.slx")

%% plotting

fig1 = figure
plot(compass,'b','LineWidth',1.5)
grid
title("Compass heading",'Interpreter','latex')
legend({'Heading $\psi$'},'Interpreter','latex','location','northeastoutside');
xlabel("Time (Seconds)",'Interpreter','latex','FontSize', 15)
ylabel("$\psi$ (Degrees)",'Interpreter','latex','FontSize', 15)
set(gcf, 'Position', [100, 100, 700, 400])
set(gca,'FontSize',12,'linewidth',1.0)


fig2 = figure
plot(u,'b','LineWidth',1.5)
grid
title("Controller output",'Interpreter','latex')
legend({'Rudder input'},'Interpreter','latex','location','northeastoutside');
xlabel("Time (Seconds)",'Interpreter','latex','FontSize', 15)
ylabel("$\delta$ (Degrees)",'Interpreter','latex','FontSize', 15)
set(gcf, 'Position', [100, 100, 700, 400])
set(gca,'FontSize',12,'linewidth',1.0)

%% saves figures if there is none

if exist('5_3d_compass.eps', 'file') ~= 2
    saveas(fig1,'5_3d_compass.eps','eps');
end
if exist('5_3d_controllerOutput.eps', 'file') ~= 2
    saveas(fig1,'5_3d_controllerOutput.eps','eps');
end