close all; clear;

g = @(x,y,alpha) alpha*sqrt((x-0.5).^2+(y-0.5).^2);
f = @(x,y) abs(x-y);

%a)
alpha = 0;
m = 4;
h = 1/(m+1);

x = h:h:1-h;
y = h:h:1-h;
[X,Y] = meshgrid(x,y);
X = X(:);
Y = Y(:);

%create rhs
b = f(X,Y);
b = b(:);


e = ones(m,1);
T = spdiags([e -4*e e], -1:1, m, m);
A = spdiags([eye(m,m),T,eye(m,m)],-1:1,m,m);
figure()
spy(A)

gg = g(X,Y,alpha);
G  = spdiags(gg(:),0);
figure()
spy(G)
A = A+G;



