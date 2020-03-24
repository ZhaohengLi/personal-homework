%% Init
clc;
clear;

%% Global Variables
n = 20; % 矩阵阶数
range = [0, 100]; % 随机数范围
epsilon = 1e-5; % 误差要求
M = 200; % 迭代最大步数
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