function [x,n,sequence]=GaussSeidel(A,b,x0,eps,varargin)
% �����Է������Gauss-Seidel�����������ø�ʽΪ
%  [x, n] = guaseidel(A,b,x0,eps,M),
%  ����, A Ϊ���Է������ϵ������b Ϊ�����eps Ϊ����Ҫ��Ĭ��Ϊ 1e-10,
%  M Ϊ������������Ĭ��Ϊ 200,
%  x Ϊ���Է�����Ľ⣬n ��������.

if nargin==3
    eps=1.0e-10;
    M=200;
elseif nargin<3
    disp('���������������3��');
    return
elseif nargin==5
    M=varargin{1};
end

sequence = [];
sequence(:,1) = x0;
D = diag(diag(A)); % ��A�ĶԽǾ���
L = -tril(A,-1); % ��A�������Ǿ���,�����Խ���
U = -triu(A,1); % ��A�������Ǿ���
G = (D-L)\U;
f = (D-L)\b;
x = G*x0+f;
n=1;

while norm(x-x0)>=eps
    if(n>=M)
        disp('����GaussSeidel�����������������趨ֵ,���ܲ�������');
        return;
    end
    x0 = x;
    sequence(:,n+1) = x;
    x = G*x0+f;
    n = n+1;
end

