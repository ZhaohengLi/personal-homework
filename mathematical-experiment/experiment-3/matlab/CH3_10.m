x = [0, 3, 5, 7, 9, 11, 12, 13, 14, 15];
y1 = [0, 1.8, 2.2, 2.7, 3.0, 3.1, 2.9, 2.5, 2.0, 1.6];
y2 = [0, 1.2, 1.7, 2.0, 2.1, 2.0, 1.8, 1.2, 1.0, 1.6];

x_ex = 0 : 0.1 : 15;

y1_ex_lagr = lagr(x, y1, x_ex);
y2_ex_lagr = lagr(x, y2, x_ex);

y1_ex_line = interp1(x, y1, x_ex, 'linear');
y2_ex_line = interp1(x, y2, x_ex, 'linear');

y1_ex_spli = interp1(x, y1, x_ex, 'spline');
y2_ex_spli = interp1(x, y2, x_ex, 'spline');

disp(x_ex);
disp(y1_ex_lagr);

figure;
subplot(3,1,1);
title("lagr");
hold on;
scatter(x, y1);
scatter(x, y2);
plot(x_ex, y1_ex_lagr);
plot(x_ex, y2_ex_lagr);

subplot(3,1,2);
title("linear");
hold on;
scatter(x, y1);
scatter(x, y2);
plot(x_ex, y1_ex_line);
plot(x_ex, y2_ex_line);

subplot(3,1,3);
title("spline");
hold on;
scatter(x, y1);
scatter(x, y2);
plot(x_ex, y1_ex_spli);
plot(x_ex, y2_ex_spli);

S11 = trapz(x_ex, y1_ex_lagr) - trapz(x_ex, y2_ex_lagr);
S12 = trapz(x_ex, y1_ex_line) - trapz(x_ex, y2_ex_line);
S13 = trapz(x_ex, y1_ex_spli) - trapz(x_ex, y2_ex_spli);

S21 = simpson(x_ex, y1_ex_lagr) - simpson(x_ex, y2_ex_lagr);
S22 = simpson(x_ex, y1_ex_line) - simpson(x_ex, y2_ex_line);
S23 = simpson(x_ex, y1_ex_spli) - simpson(x_ex, y2_ex_spli);




