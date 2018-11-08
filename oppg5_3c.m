%% oppg 5.3 b

%% init
% getting some variables from 5.3.a
run oppg5_3.m
close all

%% running simulation

sim("ship_5_3_c.slx")

%% plotting

fig1 = figure
plot(compass,'LineWidth',1.5)
hold on
plot(u,'LineWidth',1.5)
grid
title("$\psi_r = 30^\circ$ with current disturbance",'Interpreter','latex')
legend({'Heading $\psi$', 'Controller output'},'Interpreter','latex','location','northeastoutside');
xlabel("Time (Seconds)",'Interpreter','latex','FontSize', 15)
ylabel("(Degrees)",'Interpreter','latex','FontSize', 15)
set(gcf, 'Position', [100, 100, 700, 400])
set(gca,'FontSize',12,'linewidth',1.0)


%% saves figures if there is none

if exist('5_3c_OutputAndHeading.eps', 'file') ~= 2
    saveas(fig1,'5_3c_OutputAndHeading.eps','epsc');
end