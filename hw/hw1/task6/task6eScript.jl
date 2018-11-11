using MAT
using LinearAlgebra
using PyCall
using PyPlot
using LaTeXStrings
using Random

include("../../../src/arnoldi_DGS_complex.jl")
Random.seed!(1234);
A = matread("Bwedge.mat")["B"];
N = size(A,1);
σ = -11 + im * 2;
B = inv(A-σ*I)
eigB = eigvals(B);
b = randn(N)
b = b./norm(b);
m_vec = 1:12;
error_vec = zeros(Complex,length(m_vec));
for n = 1:length(m_vec)
    m = m_vec[n]
    Q,H = arnoldi_DGS_complex(B,b,m);
    H_eigvals = eigvals(H[1:m,1:m]);
    error_vec[n] = abs(H_eigvals[1]-eigB[1]);
end



figure()
semilogy(m_vec,error_vec,"ro-")
semilogy(m_vec,(10^(-10))*ones(size(m_vec)),"b--")
xlabel("m")
ylabel("λ -λritz1(m)")
title("Convergence of first eigenvalue fo B")
xticks(m_vec)
savefig(string("task6e_eigConv.png"))
close()
