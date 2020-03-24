function [x, k] = LinJacobi(A,b,ep,M)

%  求线性方程组的Jacobi迭代法，调用格式为
%  [x, k] = LinJacobi(A,b,ep,it_max)
%  其中
%  A 为线性方程组的系数矩阵，b 为常数项，ep 为精度要求，默认为1e-5,
%  M 为最大迭代次数，默认为100
%  x 为线性方程组的解，k迭代次数

if nargin <4 M = 100; end;

if nargin <3 eps = 1e-5; end;

D = diag(A); L = - tril(A, -1);  U = - triu(A, 1);

if min(abs(D))<1e-10

   error('% 对角元素为0，计算失败！');

end

n = length(b); xk = zeros(n,1);  k=1;

B = D(L+U); f = Db;

while k<M

   xk1 = B*xk + f;

   if max(abs(xk1-xk))<ep    break;  end

   xk = xk1; k = k+1;

end