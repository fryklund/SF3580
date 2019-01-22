close all; clear;
%Solution to task 12 c), homework 4, numerical linear algebra
%Anna Broms 2019-01-19
g = @(x,y,alpha) alpha*sqrt((x-0.5).^2+(y-0.5).^2);
f = @(x,y) abs(x-y);
m = 100;

%%
%SOLVE system, task I) and II).
alpha = 0;
[A,b,X,Y,~] = construct_poisson_matrices(f,g,m,alpha);
x = A\b;
figure(1)
Z = reshape(x,m,m);
surf(X,Y,Z);
xlabel('x','interpreter','latex');
ylabel('y','interpreter','latex');

alpha = 0; 
[~,b,X,Y,h] = construct_poisson_matrices(f,g,m,alpha);
Q = reshape(b,m,m);

e = ones(m,1);
T = spdiags([e -2*e e], -1:1, m, m);
Z2 = lyap(T,-Q*h^2);

figure(2)
surf(X,Y,Z2);
xlabel('x','interpreter','latex');
ylabel('y','interpreter','latex');

norm(Z-Z2)
%%
%Solve system task III) and IV)
close all
alpha = 1;
[A,b,X,Y,~] = construct_poisson_matrices(f,g,m,alpha);
x = A\b;
figure(1)
Z = reshape(x,m,m);
surf(X,Y,Z);
xlabel('x','interpreter','latex');
ylabel('y','interpreter','latex');

[x2,flag,relres,iter] = gmres(A,b,20);
if (flag == 1)
    disp('did not converge, residual is');
    relres
    disp('number of iterations');
    iter
    
end
Z2 = reshape(x2,m,m);

figure(2)
surf(X,Y,Z2);
disp('error using gmres')
norm(Z-Z2)

%%
%Solve system task V)












