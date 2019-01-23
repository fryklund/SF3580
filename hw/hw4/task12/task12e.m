%Solves the last part of task12, HW4
clear;
close all;


%%
%Naive approach using backslash
f = @(x,y) abs(x-y);
g = @(x,y,alpha) alpha*sqrt((x-0.5).^2+(y-0.5).^2);

alpha = 0;
M = [20:20:200];

for j = 1:10
    m = M(j);
    [A,b,X,Y,h] = construct_poisson_matrices(f,g,m,alpha);
    G = spalloc(m^2,m^2,1);
    G((m/2-1)*m+m/4,(m/2-1)*m+m/4) = 1/h;
    A = A+G;
    tstart = tic;
    for i = 1:10
        x1 = A\b;
    end
    t_elapsed1(j) = toc(tstart)/10;
    X1 = reshape(x1,m,m);
    %%
    %Solve using Sherman-Morrison
    U = spalloc(m^2,1,1);
    U((m/2-1)*m+m/4) = 1;
    U = reshape(U,m,m);

    v = spalloc(m^2,1,1);
    v((m/2-1)*m+m/4) = 1/h;
    V = reshape(v,m,m);

    e = ones(m,1);
    T = spdiags([e -2*e e], -1:1, m, m);
    F = reshape(b,m,m);
    
    tstart = tic;
	for i = 1:10
        alpha = lyap(T,-h^2*F);
        alpha = alpha(:);
        beta = lyap(T,-U*h^2);
        beta = beta(:);
        x2 = alpha-beta*(v'*alpha)/(1+v'*beta);
    end
    t_elapsed2(j) = toc(tstart)/10;

    %X2 = reshape(x2,m,m);
end

% figure(1)
% mesh(X,Y,X1);
% 
% figure(2)
% mesh(X,Y,X2);

%Attempt at computing timing results. 
figure()
plot(M,t_elapsed1,'b+');
hold on
plot(M,t_elapsed2,'ro');


    

