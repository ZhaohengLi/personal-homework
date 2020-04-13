%% Global Variables
global M;
M = [4, 1, 0.9607; 12, 1, 0.4399; 13, 1, 0.8143;
    17, 1, 1.3765; 21, 1, 1.2722; 5, 2, 0.5294;
    16, 2, 0.6144; 17, 2, 0.3766; 25, 2, 0.6893;
    5, 3, 0.9488; 20, 3, 0.8000; 21, 3, 1.1090;
    24, 3, 1.1432; 5, 4, 0.4758; 12, 4, 1.3402;
    24, 4, 0.7006; 8, 6, 0.4945; 13, 6, 1.0559;
    19, 6, 0.6810; 25, 6, 0.3587; 8, 7, 0.3351;
    14, 7, 0.2878; 16, 7, 1.1346; 20, 7, 0.3870;
    21, 7, 0.7511; 14, 8, 0.4439; 18, 8, 0.8363;
    13, 9, 0.3208; 15, 9, 0.1574; 22, 9, 1.2736;
    11, 10, 0.5781; 13, 10, 0.9254; 19, 10, 0.6401;
    20, 10, 0.2467; 22, 10, 0.4727; 18, 11, 1.3840;
    25, 11, 0.4366; 15, 12, 1.0307; 17, 12, 1.3904;
    15, 13, 0.5725; 19, 13, 0.7660; 15, 14, 0.4394;
    16, 14, 1.0952; 20, 16, 1.0422; 23, 16, 1.8255;
    18, 17, 1.4325; 19, 17, 1.0851; 20, 19, 0.4995;
    23, 19, 1.2277; 24, 19, 1.1271; 23, 21, 0.7060;
    23, 22, 0.8052];

%% CAl
% x0 = ones(48,1);
x0 = -1+2 * rand(48, 1);
opt = optimset('HessUpdate', 'bfgs', 'MaxFunEvals', 1000000, 'MaxIter', 10000, 'LargeScale', 'off');
% opt = optimset('HessUpdate', 'dfp', 'MaxFunEvals', 1000000, 'MaxIter', 10000);
% opt = optimset('HessUpdate', 'steepdesc', 'MaxFunEvals', 1000000, 'MaxIter', 10000);
[xres, vres, exitr, outr] = fminunc(@atomdis, x0, opt);
y = zeros(500, 1);

for i = 1:1:500
    x0 = -1+2 * rand(48, 1);
    opt = optimset('HessUpdate', 'bfgs', 'MaxFunEvals', 1000000, 'MaxIter', 10000, 'LargeScale', 'off');
    [xres, vres, exitr, outr] = fminunc(@atomdis, x0, opt);
    y(i) = vres;
end
%% Plot
scatter(y(1:2:47),y(2:2:48))
scatter(xres(1:2:47),xres(2:2:48))

%% Function

function y = atomdis( x )
    global M;
    y = 0;
    for t = 1:length(M)
        i = M(t, 1);
        j = M(t, 2);
        dij = M(t, 3);
        
        if i == 1 
            x_i = 0;
            y_i = 0;
        else
            x_i = x(2*(i-1)-1);
            y_i = x(2*(i-1));
        end
        
        if j == 1 
            x_j = 0;
            y_j = 0;
        else
            x_j = x(2*(j-1)-1);
            y_j = x(2*(j-1));
        end
        
        y = y + ((x_i - x_j)^2 + (y_i - y_j)^2 - dij * dij) ^ 2;
    end
end