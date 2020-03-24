function [x,n,sequence,normB]=Jacobi(A,b,x0,eps,varargin)
%Jacobi.m函数为用于雅可比迭代法求解线性方程组
%A为线性方程组的系数矩阵
%b为线性方程组的常数向量
%u0为迭代初始向量
%eps为解的精度控制
%varargin为迭代步数控制
%u为线性方程组的解
%n为求出所有精度的解实际的迭代步数

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
D=diag(diag(A));%求A的对角矩阵
L=-tril(A,-1);%求A的下三角阵
U=-triu(A,1);%求A的上三角阵
B=D\(L+U);
f=D\b;
x=B*x0+f;
n=1;
normB = norm(full(B));
while norm(x-x0)>=eps
    if(n>=M)
        disp('错误：Jacob方法迭代次数到达设定值,可能不收敛。');
        return;
    end
    x0=x;
    sequence(:,n+1)=x;
    x=B*x0+f;
    n=n+1;
end