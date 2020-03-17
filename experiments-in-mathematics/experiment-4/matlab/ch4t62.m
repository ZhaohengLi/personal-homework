%% Define the constants of the boat. % Global variables
global v1;
global v2;
v1 = 0.5;
v2 = 2;
k = v1 / v2;
d = 100;

%% analy
x_ana = 0:0.1:d;
y_ana = (x_ana ./ 2) .* ((d ./ x_ana) .^ k- (x_ana ./ d) .^ k);

%% Runge Kutta Method for velocity estimation
ts = 0:1:300;
[t, xy] = ode15s(@xypartial, ts, [0, d]);
x = xy(:,1);
y = xy(:,2);
% Trim x,y for better plot
x = max(x, 0);
y = max(y, 0);

figure;
set (gcf,'Position',[100,100,760,320])

% x(t), y(t)
subplot(1,2,1);
[AX] = plotyy(t,x,t,y);
grid on;
xlabel('Time');
legend('x(t)', 'y(t)');

% y(x)
subplot(1,2,2);
hold on;
plot(x, y);
plot(y_ana, x_ana, 'b--', 'LineWidth', 2); xlabel('x');
ylabel('y');
set(gca,'ydir','reverse')
legend('y(x)数值解', 'y(x)解析解');

%% function
function [ dx ] = xypartial( t, x )
global v1;
global v2;
norm = sqrt(x(1) ^ 2 + x(2) ^ 2);
dx = [v1 - v2 * x(1) / norm; - v2 * x(2) / norm];
end