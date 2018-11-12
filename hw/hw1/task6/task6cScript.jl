using MAT
using LinearAlgebra
using PyCall
using PyPlot
using LaTeXStrings
using Random

include("../../../src/arnoldi_DGS_complex.jl")
#Random.seed!(1234);
B=matread("Bwedge.mat")["B"];
B_eigvals = eigvals(B);
b = randn(size(B,1))
b = b./norm(b);
m_vec = [2, 4, 8, 10, 20, 30, 40];
plot_flag = false

for n = 1:length(m_vec)
    m = m_vec[n]
    Q,H = arnoldi_DGS_complex(B,b,m);
    H_eigvals = eigvals(H[1:m,1:m]);
    if plot_flag
        figure(1)
        plot(real(B_eigvals[4:end]),imag(B_eigvals[4:end]),"bx")
        plot(real(B_eigvals[1:3]),imag(B_eigvals[1:3]),"c*")
        plot(real(H_eigvals),imag(H_eigvals),"o",markerfacecolor="none", markeredgecolor="r")
        xlabel("Re")
        ylabel("Im")
        legend(["Eigenvalues of B","Outmmost eigenvalues of B",string("Eigenvalues of H_(",m,",",m,")")])
        title(string("Eigenvalues of B and H_(",m,",",m,")"))
        savefig(string("task6c_m",m,".png"))
        close(1)
end
end
m_vec = 1:15;
ritz_vec = zeros(Complex,length(m_vec));
for n = 1:length(m_vec)
    m = m_vec[n]
    Q,H = arnoldi_DGS_complex(B,b,m);
    H_eigvals = eigvals(H[1:m,1:m]);
    ritz_vec[n] = H_eigvals[1];
end

figure()
semilogy(m_vec,abs.(ritz_vec-B_eigvals[1]*ones(length(m_vec))),"ro-")
semilogy(m_vec,(10^(-10))*ones(length(m_vec)),"b--")
xlabel("m")
ylabel("λ -λritz1(m)")
title("Convergence of first eigenvalue fo B")
xticks(m_vec)
savefig(string("task6c_eigConv.png"))
close()
