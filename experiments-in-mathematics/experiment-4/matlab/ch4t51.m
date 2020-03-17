%% Define the constants of the backet. % Global variables
global m;
global G;
global F;
global alpha;
m = 527.436 * 0.4536;
g = 9.8;
G = m * g;
F = 470.327 * 0.4536 * 9.8;
alpha = 0.08 * 0.4536 * 9.8 / 0.3048;
depth_water = 300 * 0.3048;
speed_limit = 40 * 0.3048;
%% Runge Kutta Method for velocity estimation
ts = 0:0.1:13;
v0 = 0;
[t, v] = ode45(@vpartial, ts, v0);
%% Linear integral for depth integral
h = [0];
for i = 2:length(t)
h = [h; trapz(t(1:i), v(1:i))];
end
%% Plot the figure
[AX] = plotyy(t,h / 0.3048,t,v / 0.3048); grid on;
set(AX(1), 'yTick', 0:50:300);
set(AX(2), 'yTick', 0:10:60);
xlabel('Time');
ylabel('Value (measured by ft)');
legend('Depth', 'Velocity');

%% Fuction
function [ dx ] = vpartial( t, x )
% Global variables
global m;
global G;
global F;
global alpha;
% RHS of the equation
dx = (G - F - alpha * x) / m;
end