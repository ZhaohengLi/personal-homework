%% Gloabal Variables
global r1;
global r2;
global n1;
global n2;
global s1;
global s2;
r1 = 1;
r2 = 1;
n1 = 100;
n2 = 100;
s1 = 0.6;
s2 = 0.6;

%% Solve
ts=[0:0.1:50];%时间区间
x0=[10,10];%初始条件
opt=odeset('reltol',1e-6,'abstol',1e-9);%相对误差1e-6，绝对误差1e-9
[t,x]=ode45(@odeFunc,ts,x0,opt);

figure;
grid on;

subplot(1,2,1);
hold on;
plot(t,x(:,1),'LineWidth',2);
gtext('x(t)');
plot(t,x(:,2),'LineWidth',2);
gtext('y(t)');
hold off;

subplot(1,2,2);
plot(x(:,1),x(:,2),'LineWidth',2);
xlabel('x');
ylabel('y');


%% Function
function dx = odeFunc(t, x)
global r1;
global r2;
global n1;
global n2;
global s1;
global s2;
dx = [r1*x(1)*(1-x(1)/n1-s1*x(2)/n2); r2*x(2)*(1-s2*x(1)/n1-x(2)/n2)];
end