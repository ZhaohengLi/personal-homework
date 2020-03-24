%% Global Variables
n = 5;
epsilon = 1e-10;
disturbA = 0; % 为1则A扰动 为0则b扰动

%% Cal

originalA1 = generateA1(n);
originalA2 = hilb(n);

originalb1 = cal(originalA1);
originalb2 = cal(originalA2);

A1 = originalA1;
A2 = originalA2;
b1 = originalb1;
b2 = originalb2;

if disturbA
    A1(n,n) = A1(n,n) + epsilon;
    A2(n,n) = A2(n,n) + epsilon;
else
    b1(n,1) = b1(n,1) + epsilon;
    b2(n,1) = b2(n,1) + epsilon;
end


x1 = A1\b1;
x2 = A2\b2;

originalx = ones(n,1);

condA1 = cond(originalA1)
deltaA1 = norm(originalA1-A1)/norm(originalA1)
deltab1 = norm(originalb1-b1)/norm(originalb1)
deltax1 = norm(originalx-x1)/norm(originalx)

condA2 = cond(originalA2)
deltaA2 = norm(originalA2-A2)/norm(originalA2)
deltab2 = norm(originalb2-b2)/norm(originalb2)
deltax2 = norm(originalx-x2)/norm(originalx)

if disturbA
    check1 = condA1*deltaA1/deltax1
    check2 = condA2*deltaA2/deltax2
else 
    check1 = condA1*deltab1/deltax1
    check2 = condA2*deltab2/deltax2
end

%% Functions
function result = generateA1(n)
v = zeros(1,n);
for i = 0:n-1
    v(1,i+1)=1+0.1*i;
end
result = fliplr(vander(v));
end

function b = cal(A)
[m,n]=size(A);
b=zeros(m,1);
for i = 1:m
    for j = 1:n
        b(i,1)=b(i,1)+A(i,j);
    end
end
end