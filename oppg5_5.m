%% 5.5a

%Parameters
K = 0.16;
T = 75;
omega0 = pi/4; %0.7823;
lambda = 0.07;
sigma = 0.0281;
Kw = 2*lambda*omega0*sigma

% Sampling
fs = 10;
Ts = 1/fs;

% The system
A = [0, 1, 0, 0, 0;
    -omega0^2, -2*lambda*omega0, 0, 0, 0
    0, 0, 0, 1, 0
    0, 0, 0, -1/T, -K/T
    0, 0, 0, 0, 0];

B = [0;
    0;
    0;
    K/T;
    0];

E = [0,0;
    Kw,0;
    0,0;
    0,0;
    0,1];

C = [0, 1, 1, 0, 0];


% Discretizing

syms s t;

Ad = vpa(ilaplace((s*eye(5)-A)^-1, Ts),5);

eat = @(t) ilaplace(((s*eye(length(A)) - A))^-1)

Bd = vpa(int(eat,t,0,Ts)*B,3);
Ed = vpa(int(eat,t,0,Ts)*E,3);

Cd = C;


% Discretizing using matlab function (equivalent)

% [Ad,Bd] = c2d(A,B,Ts);
% Cd = C;
% [Ad,Ed] = c2d(A,E,Ts);


%% 5.5b

% run simulation to get disturbance
sim("ship_5_5b.slx");

%find the variance 
sigma = var(simout.data);
R = sigma;

%% 5.5 d&e variable values

% given variables
Q = [30 0; 0 1e-6];

P0bar = [1 0 0 0 0;
        0 0.013 0 0 0;
        0 0 pi^2 0 0;
        0 0 0 1 0;
        0 0 0 0 2.5e-3];
    
x0bar = [0 0 0 0 0]';
I = eye(5);

% PD-controller
Kpd = 0.8159;
Td = 75;
Tf = 8.3910;

parameters = struct('A',Ad,'B',Bd,'C',Cd,'E',Ed,'I',I,'Q',Q,'R',R,'P0bar',P0bar,'x0bar',x0bar);

%% 5.5d

% run simulation
sim5d = sim("ship_5_5d.slx", "Stoptime", "600");

% plot
figure
plot(sim5d.compass);
hold on
plot(sim5d.compass_est);
grid
title("$\psi_r = 30^\circ$ with disturbances",'Interpreter','latex')
legend({'Heading $\psi$', 'Est heading $\psi^-$'},'Interpreter','latex','location','northeastoutside');
xlabel("Time (Seconds)",'Interpreter','latex','FontSize', 15)
ylabel("(Degrees)",'Interpreter','latex','FontSize', 15)
set(gcf, 'Position', [100, 100, 700, 400])
set(gca,'FontSize',12,'linewidth',1.0)

figure
plot(sim5d.u)
hold on
plot(sim5d.rudderBias_est)

grid
title("$\psi_r = 30^\circ$ with disturbances",'Interpreter','latex')
legend({'rudder input', 'Est bias $r$'},'Interpreter','latex','location','northeastoutside');
xlabel("Time (Seconds)",'Interpreter','latex','FontSize', 15)
ylabel("(Degrees)",'Interpreter','latex','FontSize', 15)
set(gcf, 'Position', [100, 100, 700, 400])
set(gca,'FontSize',12,'linewidth',1.0)


%% 5.5e

% run simulation
sim5e = sim("ship_5_5e.slx", "Stoptime", "600");



% plot

%% 5.5f

Q = [30 0; 0 1e-6];

parameters.Q = Q;

% run simulation
sim5f_d = sim("ship_5_5d.slx", "Stoptime", "600");

% plot eller lagre data


% run simulation
sim5f_e = sim("ship_5_5e.slx", "Stoptime", "600");

% plot









