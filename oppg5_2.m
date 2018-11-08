%% 5.2 a

% Import wave.mat

x = psi_w(2,:).*(pi/180);
window = 4096;
noverlap = [];
fr = []; % 
fs = 10; % Number of samples per unit time (sampling frequency)

[pxx,f] = pwelch(x, window, noverlap, fr, fs); % PSD estimate

pxx = pxx*(1/(2*pi));
f = f*(2*pi);

plot(f, pxx, 'LineWidth',1.5);
axis([0,2, 0, 0.0008])
title("Power Spectral Density analysis of waves",'Interpreter','latex')
legend({'En strek'},'Interpreter','latex','location','northeastoutside')
set(gca,'FontSize',12,'linewidth',1.0)
set(gcf, 'Position', [100, 100, 700, 400])
xlabel("$\omega$ (rad/s)",'Interpreter','latex','FontSize', 15)
ylabel("$\sigma^2$",'Interpreter','latex','FontSize', 15)

%% 5.2 b



%% 5.2 c

omega0 = f(pxx==max(pxx))


%% 5.2 d

% Med dette så plotter vi noe fornuftig

lambda = 0.07;
omega0 = 0.7823;
sigma = sqrt(max(pxx));
K_w = 2*lambda*omega0*sigma;
w = linspace(0,2,2000);
P_w = (K_w^2.*f.^2)./(f.^4+(4*lambda^2-2).*f.^2*omega0^2+omega0^4)

% x = lsqcurvefit(FUN, X0, XDATA, YDATA)

hold on
plot(f,P_w,'--r','LineWidth',1.5)
legend({'En strek','$\lambda = 0.07$'},'Interpreter','latex','location','northeastoutside')


