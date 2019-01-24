close all
figure(1)
tV = [-10,-5,0,5,10];
legend_markers = ["k-.","k--","k-","ro--","ro-."];
for i = 1:5
    t = tV(i);
    rand('seed',0); nx=5;
    A0=-gallery('wathen',nx,nx);
    n=length(A0); A=A0-t*speye(n,n);
    b=eye(n,1);
    X = lyap(A,b*b');
    sigma = svd(X)+eps;
    semilogy(sigma,legend_markers(i))
    hold on
end
legend('t = -10','t = -5','t = 0','t = 5','t = 10')
hold off
xlabel('$k$','interpreter','latex')
ylabel('$\sigma_{k}(X)$','interpreter','latex')
xticks([0 20 40 60 80])
