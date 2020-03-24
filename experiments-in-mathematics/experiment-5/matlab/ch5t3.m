%% Init
clc;
clear;

%% Global Variables
n = 20; % �������
range = [0, 100]; % �������Χ
epsilon = 1e-5; % ���Ҫ��
M = 200; % ���������
cycle = 15;
%% Cal
a1 = sparse(1:n,1:n,3,n,n);
a2 = sparse(1:n-1,2:n,-1/2,n,n);
a3 = sparse(1:n-2,3:n,-1/4,n,n);

b = range(1) + (range(2)-range(1)).*rand(n,1);
x0 = range(1) + (range(2)-range(1)).*rand(n,1);

step = zeros(cycle,1);
normB = zeros(cycle, 1);

for i = 1:cycle
A = 2^(i-1).*a1+a2+a3+a2'+a3';
[~, step(i,1), ~,normB(i,1)] = Jacobi(A,b,x0,epsilon,M);
end