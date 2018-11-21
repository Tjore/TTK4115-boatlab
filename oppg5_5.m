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

[Ad,Bd] = c2d(A,B,Ts);
Cd = C;
[Ad,Ed] = c2d(A,E,Ts);


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
sim("ship_5_5d.slx");

% plot


%% 5.5e

% run simulation
sim("ship_5_5e.slx");

% plot


