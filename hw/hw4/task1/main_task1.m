%Test of the lyapunov equation solvers
clear; close all;
N = round(logspace(1,2,25));
for k= 1:length(N)
    A = rand(N(k));
    P = rand(N(k));
    
    tstart = tic;
    X1=lyap0(A,P);
    tfirst = toc(tstart);
    
    tstart = tic;
    X2 = naiveLyap(A,P);
    tsecond = toc(tstart);
    figure(1)
    loglog(N(k),tfirst,'.b')
    hold on
    loglog(N(k),tsecond,'.r');
    if k == 1
        loglog(N,1e-10*N.^6,'k--');
        loglog(N,1e-5*N.^3,'k.-');
    end

    
    
    figure(2)
    loglog(N(k),norm(X1-X2),'.');
    hold on
    
end

figure(1)
xlabel('n','interpreter','latex')
ylabel('CPU time (s)','interpreter', 'latex')

l = legend('naive approach','Bartels-Stewart','$\mathcal O(n^6)$','$\mathcal O(n^3)$')
set(l,'interpreter','latex')

figure(2)
xlabel('n','interpreter','latex')
ylabel('Difference in norm between solutions','interpreter','latex')

    