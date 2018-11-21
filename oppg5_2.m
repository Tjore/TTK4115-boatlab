%% 5.2 a
close all

% Import wave.mat

x = psi_w(2,:).*(pi/180);
window = 4096;
noverlap = [];
fr = []; % 
fs = 10; % Number of samples per unit time (sampling frequency)

[pxx,f] = pwelch(x, window, noverlap, fr, fs); % PSD estimate

pxx = pxx*(1/(2*pi));
omega = f*(2*pi);

plot(omega, pxx, 'LineWidth',1.5);
axis([0,2, 0, 0.0008])
xticks([0, pi/8, pi/4, 3*pi/8, pi/2, pi])
xticklabels({'0', '?/8', '?/4', '3?/8', '?/2', '?'})
title("Power Spectral Density analysis of waves",'Interpreter','latex')
legend({'$S_{\psi_w}(\omega)$'},'Interpreter','latex','location','northeastoutside')
set(gca,'FontSize',12,'linewidth',1.0)
set(gcf, 'Position', [100, 100, 700, 400])
xlabel("$\omega$ (rad/s)",'Interpreter','latex','FontSize', 15)
ylabel("Power \ s/rad",'Interpreter','latex','FontSize', 15)
grid

%% 5.2 b



%% 5.2 c

omega0 = omega(pxx==max(pxx))

%% 5.2 d

% Med dette så plotter vi noe fornuftig

lambda = 0.07;
omega0 = 0.7823;
sigma = sqrt(max(pxx));
K_w = 2*lambda*omega0*sigma;
w = linspace(0,2,2000);
P_w = (K_w^2.*omega.^2)./(omega.^4+(4*lambda^2-2).*omega.^2*omega0^2+omega0^4)
% x = lsqcurvefit(FUN, X0, XDATA, YDATA)

hold on
plot(omega,P_w,'--r','LineWidth',1.5)

legend({'$S_{\psi_w}(\omega)$','$\lambda = 0.07$'},'Interpreter','latex','location','northeastoutside')


