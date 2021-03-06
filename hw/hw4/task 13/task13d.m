close all
clear all
% [t = 0, nx = 169, err = 1.9412e-11, itr = 10][t = 1, nx = 169, err =4.3666e-12, itr = 10][t = 10, nx = 168, err = 4.3085e-14, itr = 10],[t = 100, nx = 167, err= 3.3229e-16, itr = 7], [t = 1000, nx = 157,  3.4486e-16, itr = 4]
t = 0;
rand('seed',0); nx=169;% nx = 170
A0=-gallery('wathen',nx,nx);
n=length(A0); A=A0-t*speye(n,n);
b=eye(n,1);
E = speye(n,n);
LE = E;
tol=1e-14;
tolY=1e-14;
tic
[Z,err2] = kpik(A,E,LE,b,10,tol,tolY); %X = Z * Z'
toc
disp(['Iterations: ' num2str(length(err2))])
disp(['Error: ' num2str(err2(end))])


%%
t = 0;
rand('seed',0); nx=17; % [t = 0, nx = 17, err = 9.1318e-14][t = 1, nx = 17, err = 6.4533e-14][t = 10, nx = 17, err = 3.0420e-14],[t = 100, nx = 17, err= 6.6851e-15], [t = 1000, nx = 17,  8.0789e-15]
A0=-gallery('wathen',nx,nx);
n=length(A0); A=A0-t*speye(n,n);
b=eye(n,1);
B = b*b';
tic
X = lyap(A,B);
toc
disp(['Error: ' num2str(norm(A*X+X*A'+B))])