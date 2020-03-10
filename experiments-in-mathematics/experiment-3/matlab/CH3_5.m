
X1 = -1 : 2/100 : +1;
X2 = -1 : 2/1000 : +1;
Y1 = 2*sqrt(1-X1.^2);
Y2 = 2*sqrt(1-X2.^2);
PI11 = trapz(X1,Y1);
PI12 = trapz(X2, Y2);

F = @(X) 2*sqrt(1-X.^2);
PI2 = quad(F, -1, +1);
PI3 = quadl(F, -1, +1);

fprintf("当区间个数为100 使用梯形公式得到的结果为：PI11=%.15f\n", PI11);
fprintf("当区间个数为1000 使用梯形公式得到的结果为：PI12=%.15f\n", PI12);
fprintf("使用辛普森公式得到的结果为：PI=%.15f\n", PI2);
fprintf("使用高斯公式得到的结果为：PI=%.15f\n", PI3);
