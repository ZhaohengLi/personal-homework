function [x, k] = LinGauSeid(A,b,eps,it_max)

%  求线性方程组的Gauss-Seidel迭代法，调用格式为

%  [x, k] = LinGauSeid(A,b,ep,it_max)

%  其中

%  A 为线性方程组的系数矩阵，b 为常数项，ep 为精度要求，默认为1e-5,

%  it_max 为最大迭代次数，默认为100

%  x 为线性方程组的解，k迭代次数

if nargin <4 it_max = 100; end;

if nargin <3 eps = 1e-5; end;

if min(diag(A))<1e-10

error('% 对角元素为0，计算失败！');

end

n = length(b); xk = zeros(n,1);  k=1;

B = -tril(A)triu(A,1); f = tril(A)b;

while k<it_max

    xk1 = B*xk + f;

    if max(abs(xk1-xk))<eps

        break;

    end

    xk = xk1; k = k+1;

end