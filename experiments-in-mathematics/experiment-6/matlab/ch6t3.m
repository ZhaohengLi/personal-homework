%% Global Variables
x0 = 50; % 借款总额
a1 = 0.45; % 每月还款额
a2 = 4.5;
k1 = 15; % 还清年限
k2 = 20;
%% Cal
init = 0.1;
r1 = fzero(@rate,init,[],x0,a1,k1,1)*12
r2 = fzero(@rate,init,[],x0,a2,k2,0)

%% Func
function y = rate(r,x0,a,k,byMonth)
    if (byMonth)
        y = (1+r)^(k*12)*x0-a*((1+r)^(k*12)-1)/r;
    else
        y = (1+r)^k*x0-a*((1+r)^k-1)/r;
    end
end