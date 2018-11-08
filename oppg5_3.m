%% 5.3 a

s = tf('s');
% syms s

K = 0.16;
T = 75;
Hb = (K/(s*(T*s+1))); % Transfer function for baot system from p5.2b

% We want these values
omegac = 0.1;
% 50 phase margin, omegac at -180+50=-130 degrees

Tf = -1/(omegac*tand(130)); % Want omegac ca = 0.1
Kpd = sqrt(Tf^2*omegac^4+omegac^2)/K; % Controller gain, we need a phase margin of 50 degrees (not rad)
Td = T; % Time constant that cancels out the systems time constant

Hpd = Kpd*(Td*s+1)/(Tf*s+1);

Hol = Hb*Hpd;

% bode(Hol) ja
[Gm,Pm,Wcg,Wcp] = margin(Hol)
margin(Hol)






