%% oppg 5.3 b

%% init
% getting some variables from 5.3.a
run oppg5_3.m
close all

%% running simulation

sim("ship_5_3_b.slx")

%% plotting

figure
plot(compass)
grid
title("Compass heading",'Interpreter','latex')
legend({'Heading $\psi$'},'Interpreter','latex','location','northeastoutside');
xlabel("Time (Seconds)",'Interpreter','latex','FontSize', 15)
ylabel("$\psi$ (Degrees)",'Interpreter','latex','FontSize', 15)
set(gcf, 'Position', [100, 100, 700, 400])
set(gca,'FontSize',12,'linewidth',1.0)


figure
plot(u)
grid
title("Controller output",'Interpreter','latex')
legend({'Rudder input'},'Interpreter','latex','location','northeastoutside');
xlabel("Time (Seconds)",'Interpreter','latex','FontSize', 15)
ylabel("$\delta$ (Degrees)",'Interpreter','latex','FontSize', 15)
set(gcf, 'Position', [100, 100, 700, 400])
set(gca,'FontSize',12,'linewidth',1.0)