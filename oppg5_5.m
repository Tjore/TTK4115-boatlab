%% 5.5a

%Parameters
K = 0.16;
T = 75;
omega0 = 0.7823;
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

% run simulation to get noise
sim("ship_5_5b.slx");

%find the variance 
sigma = var(simout.data);


%% 5.5c

Q = [30, 0; 0, 10^-6];

P0neg = [1, 0, 0, 0, 0;
    0, 0.013, 0, 0, 0;
    0, 0, pi^2, 0, 0;
    0, 0, 0, 1, 0;
    0, 0, 0, 0, 0.0025];

xhat0neg = [0;0;0;0;0];
