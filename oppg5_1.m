%% 5.1 b
close all

%plotting the first response
amplitude = 1;
frequency = 0.005;
sim("ship_5_b.mdl")
figure
plot(simout,'LineWidth',1.5)
hold on
plot(simout.Time,ones(1,length(simout.time))*max(simout.data),'-.m','LineWidth',1.5)
plot(simout.Time,ones(1,length(simout.time))*min(simout.data(3000:end)),'-.r','LineWidth',1.5)
txt = strcat("\downarrow ",num2str(max(simout.data)));
text(3000,max(simout.data)+2,txt,'Interpreter','tex');
txt = strcat("\uparrow ",num2str(min(simout.data(3000:end))));
text(3000,min(simout.data(3000:end))-2,txt,'Interpreter','tex');
grid
title("System response to sinus input",'Interpreter','latex')
legend({'Heading $\psi$','Max value','Min value'},'Interpreter','latex','location','northeastoutside');
set(gcf, 'Position', [100, 100, 700, 400])
set(gca,'FontSize',12,'linewidth',1.0)
xlabel("Time (Seconds)",'Interpreter','latex','FontSize', 15)
ylabel("$\psi$ (Degrees)",'Interpreter','latex','FontSize', 15)
hold off
f005b = simout; %saving the data for later use

% plotting the second response
amplitude = 1;
frequency = 0.05;
sim("ship_5_b.mdl")
figure
plot(simout.Time(1:6007),simout.Data(1:6007),'LineWidth',1.5)
hold on
plot(simout.Time(1:6007),ones(1,6007)*max(simout.data),'-.m','LineWidth',1.5)
plot(simout.Time(1:6007),ones(1,6007)*min(simout.data(3000:end)),'-.r','LineWidth',1.5)
txt = strcat("\downarrow ",num2str(max(simout.data)));
text(1500,max(simout.data)+0.2,txt);
txt = strcat("\uparrow ",num2str(min(simout.data(3000:end))));
text(1500,min(simout.data(3000:end))-0.2,txt);
grid
title("System response to sinus input",'Interpreter','latex')
legend({'Heading $\psi$','Max value','Min value'},'Interpreter','latex','location','northeastoutside')
set(gca,'FontSize',12,'linewidth',1.0)
set(gcf, 'Position', [100, 100, 700, 400])
xlabel("Time (Seconds)",'Interpreter','latex','FontSize', 15)
ylabel("$\psi$ (Degrees)",'Interpreter','latex','FontSize', 15)
hold off
%set(gca, 'FontName', 'cmr10')
f05b = simout; %saving the data for later use



%calculating the boat parametres

top = max(f005b.data(10000:end)); %for 0.005 in frequency
bot = min(f005b.data(10000:end));
A1 = (top-bot)/2;
w1 = 0.005;

top = max(f05b.data(10000:end)); %for 0.05 in frequency
bot = min(f05b.data(10000:end));
A2 = (top-bot)/2;
w2 = 0.05;

T = sqrt(((A2^2*w2^2)-(A1^2*w1^2))/((A1^2*w1^4)-(A2^2*w2^4)));
K = A1*w1*sqrt(T^2*w1^2+1);

%% 5.1 c
close all

%plotting the first response
amplitude = 1;
frequency = 0.005;
sim("ship_5_c.mdl")
figure
%c51 = figure
plot(simout,'LineWidth',1.5)
hold on
axis([0,8000,-10,80])
plot(simout.Time,ones(1,length(simout.time))*max(simout.data),'-.m','LineWidth',1.5)
plot(simout.Time,ones(1,length(simout.time))*min(simout.data(3000:end)),'-.r','LineWidth',1.5)
txt = strcat("\downarrow ",num2str(max(simout.data)));
text(3000,max(simout.data)+3,txt,'Interpreter','tex');
txt = strcat("\uparrow ",num2str(min(simout.data(3000:end))));
text(3000,min(simout.data(3000:end))-2,txt,'Interpreter','tex');
grid
title("System response to sinus input",'Interpreter','latex')
legend({'Heading $\psi$','Max value','Min value'},'Interpreter','latex','location','northeastoutside');
set(gcf, 'Position', [100, 100, 700, 400])
set(gca,'FontSize',12,'linewidth',1.0)
xlabel("Time (Seconds)",'Interpreter','latex','FontSize', 15)
ylabel("$\psi$ (Degrees)",'Interpreter','latex','FontSize', 15)
hold off
% saveas(c51, "5_c_systemResponseFrequency0_005", 'eps');

f005c = simout; %saving the data for later use

% plotting the second response
amplitude = 1;
frequency = 0.05;
sim("ship_5_c.mdl")
figure
plot(simout.Time(1:6007),simout.Data(1:6007),'LineWidth',1.5)
hold on
% plot(simout.Time(1:6007),ones(1,6007)*max(simout.data(3000:6007)),'-.m','LineWidth',1.5)
% plot(simout.Time(1:6007),ones(1,6007)*min(simout.data(3000:6007)),'-.r','LineWidth',1.5)
% txt = strcat("\downarrow ",num2str(max(simout.data(3000:6007))));
% text(1500,max(simout.data(3000:6007))+0.2,txt);
% txt = strcat("\uparrow ",num2str(min(simout.data(3000:6007))));
% text(1500,min(simout.data(3000:6007))-0.2,txt);
grid
title("System response to sinus input",'Interpreter','latex')
legend({'Heading $\psi$'},'Interpreter','latex','location','northeastoutside')
% legend({'Heading $\psi$','Max value','Min value'},'Interpreter','latex','location','northeastoutside')
set(gca,'FontSize',12,'linewidth',1.0)
set(gcf, 'Position', [100, 100, 700, 400])
xlabel("Time (Seconds)",'Interpreter','latex','FontSize', 15)
ylabel("$\psi$ (Degrees)",'Interpreter','latex','FontSize', 15)
hold off
%set(gca, 'FontName', 'cmr10')
f05c = simout; %saving the data for later use



%calculating the boat parametres

top = max(f005c.data(10000:end)); %for 0.005 in frequency
bot = min(f005c.data(10000:end));
A1n = (top-bot)/2;
w1 = 0.005;

top = max(f05c.data(10000:end)); %for 0.05 in frequency
bot = min(f05c.data(10000:end));
A2n = (top-bot)/2;
w2 = 0.05;

Tn = sqrt((A2n^2*w2^2-A1n^2*w1^2)/(A1n^2*w1^4-A2n^2*w2^4));
Kn = A1n*w1*sqrt(Tn^2*w1^2+1);


%% 5.1 d

sim("ship_5_d.mdl")

s = tf('s');
Hb = (0.162/(s*(75*s+1)));  % Parameters found from p5.2b
Hc = (0.162/(s*(35*s+1)));  % Parameters found from p5.2c
Hj = (0.17/(s*(105*s+1)));  % Denne ble funnet med jenking, passer best
H = (K/(s*(T*s+1)));        % Parameters found in Matlab by script

figure

hold on
plot(simout,'LineWidth',1.5)

% OBS Når vi bruker step() så fucker vi opp formatteringen på aksene :(
[b, tb] = step(Hb,'--r')
[c, tc] = step(Hc,'--m')
% step(Hj,'--')
% step(H,'--')

plot(tb, b, '--', 'LineWidth',1.5)
plot(tc, c, '--', 'LineWidth',1.5)

axis([0, 1000, 0, 200])

title("Comparison of step responses",'Interpreter','latex')
legend({'Ship response', 'Tf without noise', 'Tf with noise'},'Interpreter','latex','location','northeastoutside')
set(gca,'FontSize',12,'linewidth',1.0)
% set(gcf, 'Position', [100, 100, 700, 400])
xlabel("Time (Seconds)",'Interpreter','latex','FontSize', 15)
ylabel("$\psi$ (Degrees)",'Interpreter','latex','FontSize', 15)
grid
hold off
