% 5.3 a

close all

s = tf('s')
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

Hol = Hb*Hpd

% bode(Hol)
% set(gca,'FontSize',12,'linewidth',1.0)


[Gm,Pm,Wcg,Wcp] = margin(Hol)
margin(Hol)
% set(gca,'FontSize',12,'linewidth',1.0)
%title("Bode Diagram, Pm = 50 deg (at 0.1 rad/s)",'Interpreter','latex')
bode(Hol)

Hsys = (K*Kpd)/(s*(Tf*s+1))

[mag,phase,wout] = bode(Hsys);
figure
subplot(2,1,1)
semilogx(wout, 20*log10(squeeze(mag)), '-', 'LineWidth',1.5)
axis([10^-3, 10, -60, 40])
set(gca,'FontSize',12,'linewidth',1.0)
title("Bode Diagram",'Interpreter','latex')
ylabel("Magnitude (dB)",'Interpreter','latex','FontSize', 15)
grid
subplot(2,1,2)
semilogx(wout, squeeze(phase), '-', 'LineWidth',1.5)
axis([10^-3, 10, -180, -90])
yticks([-180 -130 -90])
set(gca,'FontSize',12,'linewidth',1.0)
ylabel("Phase (deg)",'Interpreter','latex','FontSize', 15)
xlabel("Frequency (rad/s)",'Interpreter','latex','FontSize', 15)
grid





