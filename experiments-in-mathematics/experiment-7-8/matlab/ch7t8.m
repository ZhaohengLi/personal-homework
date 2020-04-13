%% Global Variables
t = [0.083, 0.167, 0.25, 0.5, 0.75, 1, 1.5, 2.25 3, 4, 6, 8, 10, 12];
c = [10.9, 21.1, 27.3, 36.4, 35.5, 38.4, 34.8, 24.2, 23.6, 15.7, 8.2, 8.3, 2.2, 1.8];

%% Cal
x0 = [1,1,0];
[x, norm, res] = lsqcurvefit(@medicine,x0,t,c);

figure;
hold on;
tt = (0:0.1:12);
plot(tt, medicine(x, tt))
plot(t, c, 'ro')

%% Function

function c = medicine(x, t)
    c = x(1)*x(2)/(x(2)-x(3))*(exp(-x(3)*t)-exp(-x(2)*t));
end