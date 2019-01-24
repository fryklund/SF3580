%%
%Solve system task V)
%Using the format of task II): 
clear;
g = @(x,y,alpha) alpha*sqrt((x-0.5).^2+(y-0.5).^2);
f = @(x,y) abs(x-y);

alpha = 1;
m = 100;
[A,b,X,Y,~] = construct_poisson_matrices(f,g,m,alpha);
pre_cond_gmres = @(b) pre_cond(b,m);
[x2,flag,relres,iter] = gmres(A,b,[],1e-6,20,pre_cond_gmres);
if (flag == 1)
    disp('did not converge, residual is');
    relres
    disp('number of iterations');
    iter    
end
