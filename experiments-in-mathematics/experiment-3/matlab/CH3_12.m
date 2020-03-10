x = [0 2 4 5 6 7 8 9 10.5 11.5 12.5 14 16 17 18 19 20 21 22 23 24] * 60;
y = [2 2 0 2 5 8 25 12 5 10 12 7 9 28 22 10 9 11 8 9 3];
sum1 = trapz(x,y);
x_ex = 0 : 24*60;
y_ex = interp1(x, y, x_ex, 'spline');
sum2 = trapz(x_ex, y_ex);
figure;

subplot(2,1,1);
plot(x, y);
xlabel("Time/min");
ylabel("Cars");
title("满足约束一");


subplot(2,1,2);
plot(x_ex, y_ex);
xlabel("Time/min");
ylabel("Cars");
title("满足约束一和约束二");
