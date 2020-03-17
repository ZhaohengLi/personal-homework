%% Define the constants of the boat.
global v1;
global v2;
v1 = 1;
v2 = 2;
% k = v1 / v2;
d = 100;

%% Analytical Solutions

% plot
figure;
subplot(1,3,1);
k=0.5;
x_ana = 0:0.1:d;
y_ana = (x_ana./2) .* ((x_ana./d).^(-k) - (x_ana./d).^k);
plot(y_ana,x_ana);
set(gca,'YDir','reverse')
title("k=0.5")

subplot(1,3,2);
k=1;
x_ana = 0:0.1:d;
y_ana = (x_ana./2) .* ((x_ana./d).^(-k) - (x_ana./d).^k);
plot(y_ana,x_ana);
set(gca,'YDir','reverse')
title("k=1")

subplot(1,3,3);
k=1.5;
x_ana = 0:0.1:d;
y_ana = (x_ana./2) .* ((x_ana./d).^(-k) - (x_ana./d).^k);
plot(y_ana,x_ana);
set(gca,'YDir','reverse')
title("k=1.5")






