function [x,n,sequence]=GaussSeidel(A,b,x0,eps,varargin)
% 求线性方程组的Gauss-Seidel迭代法，调用格式为
%  [x, n] = guaseidel(A,b,x0,eps,M),
%  其中, A 为线性方程组的系数矩阵，b 为常数项，eps 为精度要求，默认为 1e-10,
%  M 为最大迭代次数，默认为 200,
%  x 为线性方程组的解，n 迭代次数.

if nargin==3
    eps=1.0e-10;
    M=200;
elseif nargin<3
    disp('输入参数个数不足3个');
    return
elseif nargin==5
    M=varargin{1};
end

sequence = [];
sequence(:,1) = x0;
D = diag(diag(A)); % 求A的对角矩阵
L = -tril(A,-1); % 求A的下三角矩阵,不带对角线
U = -triu(A,1); % 求A的上三角矩阵
G = (D-L)\U;
f = (D-L)\b;
x = G*x0+f;
n=1;

while norm(x-x0)>=eps
    if(n>=M)
        disp('错误：GaussSeidel方法迭代次数到达设定值,可能不收敛。');
        return;
    end
    x0 = x;
    sequence(:,n+1) = x;
    x = G*x0+f;
    n = n+1;
end

