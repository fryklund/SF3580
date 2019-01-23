close all; clear;
%Solution to task 12 c), homework 4, numerical linear algebra
%Anna Broms 2019-01-21
g = @(x,y,alpha) alpha*sqrt((x-0.5).^2+(y-0.5).^2);
f = @(x,y) abs(x-y);
m = 100;

%%
%SOLVE system, task I) and II).
alpha = 0;

M = [20:20:200];
for j = 1:1%10
    m = M(j);
    disp('task I');
    [A,b,X,Y,~] = construct_poisson_matrices(f,g,m,alpha);
    tstart = tic;
	for i = 1:100
        x = A\b;
    end
    t_elapsed1(j) = toc(tstart)/10;
end
% figure(1)
%Z = reshape(x,m,m);
% surf(X,Y,Z);
% xlabel('x','interpreter','latex');
% ylabel('y','interpreter','latex');

figure(2)
plot(M,t_elapsed1,'b+');

%task II)
for j = 1:1%10
    m = M(j);
    [~,b,X,Y,h] = construct_poisson_matrices(f,g,m,alpha);
    Q = reshape(b,m,m);
    disp('task II');
    e = ones(m,1);
    T = spdiags([e -2*e e], -1:1, m, m);
    tstart = tic;
	for k = 1:100
        Z2 = lyap(T,-Q*h^2);
    end
	t_elapsed2(j) = toc(tstart)/10;
end

hold on
plot(M,t_elapsed2,'ro');



% figure(2) %visualise the result
% surf(X,Y,Z2);
% xlabel('x','interpreter','latex');
% ylabel('y','interpreter','latex');
% zlabel('u','interpreter','latex');

%norm(Z-Z2)
%%
%Solve system task III) and IV)


alpha = 1;
for j = 5%:1%10
    m = M(j);
    [A,b,X,Y,~] = construct_poisson_matrices(f,g,m,alpha);
    tstart = tic;
    for i = 1:10
        x = A\b;
    end
    t_elapsed3(j) = toc(tstart)/10;
end
% plot(M,t_elapsed3,'g*');
% xlabel('m','interpreter','latex');
% ylabel('Computational time [s]','interpreter','latex');
% l = legend('$\alpha = 0$, system solved with $\backslash$','$\alpha = 0$, system solved with lyap','$\alpha = 1$, system solved with $\backslash$');
% set(l,'interpreter','latex');

figure(1)
Z = reshape(x,m,m);
surf(X,Y,Z);
xlabel('x','interpreter','latex');
ylabel('y','interpreter','latex');


m = 100;
[A,b,X,Y,~] = construct_poisson_matrices(f,g,m,alpha);

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
%Comparing pre-conditioned gmres with alpha = 1 and alpha = 0.1 to solving
%the linear system Au = b with alpha = 1. ,,

for j = 1:10
    m = M(j);
    alpha = 1;
    [A,b,~,~,~] = construct_poisson_matrices(f,g,m,alpha);
    tstart=tic;
    for k = 1:10
        x = A\b;
    end
    t_elapsed1(j) = toc(tstart)/10;

    pre_cond_gmres = @(b) pre_cond(b,m);
    tstart=tic;
    for k = 1:10
        [x3,flag,relres,iter] = gmres(A,b,[],1e-6,20,pre_cond_gmres);
    end
    t_elapsed2(j) = toc(tstart)/10;
    
    alpha = 0.1;
    [A,b,X,Y,~] = construct_poisson_matrices(f,g,m,alpha);
    pre_cond_gmres = @(b) pre_cond(b,m);
    tstart=tic;
    for k = 1:10
        [x3,flag,relres,iter] = gmres(A,b,[],1e-6,20,pre_cond_gmres);
    end
    t_elapsed3(j) = toc(tstart)/10;
end

figure()
plot(M,t_elapsed1,'b+');
hold on
plot(M,t_elapsed2,'ro');
plot(M,t_elapsed3,'g*');
xlabel('m','interpreter','latex');
ylabel('Computational time [s]','interpreter','latex');
l = legend('$\alpha = 1$, system solved with $\backslash$','$\alpha = 1$, system solved with pre-conditioned gmres','$\alpha = 0.1$, system solved with pre-conditioned gmres');
set(l,'interpreter','latex');

% if (flag == 1)
%     disp('did not converge with precond, residual is');
%     relres
%     disp('number of iterations');
%     iter    
% else
%     disp('converged with precond, residual is');
%     relres
%     disp('number of iterations');
%     iter  
% end
    














