
function [ integral ] = simpson( X, Y )
%simpson: Calculate the integral using simpson formula % Input X and Y are discrete values of y = f(x)
% X is supposed to be evenly distributed.
% Notice that length(X)=length(Y) must be odd.

m = (length(X) -1) / 2;
h = (max(X) - min(X)) / (2 * m);
integral = Y(1) + Y(2 * m + 1) + 4 * Y(2);
for k = 1:(m - 1)
    integral = integral + 4 * Y(2 * k + 2) + 2 * Y(2 * k + 1);
end
integral = integral * h / 3;
end