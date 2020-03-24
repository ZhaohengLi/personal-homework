function [x, k] = LinGauSeid(A,b,eps,it_max)

%  �����Է������Gauss-Seidel�����������ø�ʽΪ

%  [x, k] = LinGauSeid(A,b,ep,it_max)

%  ����

%  A Ϊ���Է������ϵ������b Ϊ�����ep Ϊ����Ҫ��Ĭ��Ϊ1e-5,

%  it_max Ϊ������������Ĭ��Ϊ100

%  x Ϊ���Է�����Ľ⣬k��������

if nargin <4 it_max = 100; end;

if nargin <3 eps = 1e-5; end;

if min(diag(A))<1e-10

error('% �Խ�Ԫ��Ϊ0������ʧ�ܣ�');

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