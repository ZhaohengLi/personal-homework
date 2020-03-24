function [x,n,sequence,normB]=Jacobi(A,b,x0,eps,varargin)
%Jacobi.m����Ϊ�����ſɱȵ�����������Է�����
%AΪ���Է������ϵ������
%bΪ���Է�����ĳ�������
%u0Ϊ������ʼ����
%epsΪ��ľ��ȿ���
%vararginΪ������������
%uΪ���Է�����Ľ�
%nΪ������о��ȵĽ�ʵ�ʵĵ�������

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
D=diag(diag(A));%��A�ĶԽǾ���
L=-tril(A,-1);%��A����������
U=-triu(A,1);%��A����������
B=D\(L+U);
f=D\b;
x=B*x0+f;
n=1;
normB = norm(full(B));
while norm(x-x0)>=eps
    if(n>=M)
        disp('����Jacob�����������������趨ֵ,���ܲ�������');
        return;
    end
    x0=x;
    sequence(:,n+1)=x;
    x=B*x0+f;
    n=n+1;
end