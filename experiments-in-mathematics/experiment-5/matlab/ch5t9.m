%% Global Variables
b = [0 0 5 3 0];
s = [0.4 0.6 0.6 0.9];
% h = [0; 500; 400; 200; 100];
h = [500; 500; 500; 500; 500];
%% CAl
S = [b; [diag(s) zeros(length(s), 1)]];
A = S - eye(length(b));
fprintf('Cond(A) = %f\n', cond(A));
x = A\h
err = sum(sum(A * x - h))