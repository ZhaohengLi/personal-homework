function [x, k] = LinJacobi(A,b,ep,M)

%  �����Է������Jacobi�����������ø�ʽΪ
%  [x, k] = LinJacobi(A,b,ep,it_max)
%  ����
%  A Ϊ���Է������ϵ������b Ϊ�����ep Ϊ����Ҫ��Ĭ��Ϊ1e-5,
%  M Ϊ������������Ĭ��Ϊ100
%  x Ϊ���Է�����Ľ⣬k��������

if nargin <4 M = 100; end;

if nargin <3 eps = 1e-5; end;

D = diag(A); L = - tril(A, -1);  U = - triu(A, 1);

if min(abs(D))<1e-10

   error('% �Խ�Ԫ��Ϊ0������ʧ�ܣ�');

end

n = length(b); xk = zeros(n,1);  k=1;

B = D(L+U); f = Db;

while k<M

   xk1 = B*xk + f;

   if max(abs(xk1-xk))<ep    break;  end

   xk = xk1; k = k+1;

end