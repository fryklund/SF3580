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
B_eigvecs = eigvecs(B);
b = randn(size(B,1))
global b = b./norm(b);
k =10
m = 20
n_restart = 100;
ritz_vals_vec = zeros(Complex,k,n_restart);
for j = 1:n_restart
    Q,H = arnoldi_DGS_complex(B,b,m);
    H_eigvals = eigvals(H[1:m,1:m]);
    H_eigvecs = eigvecs(H[1:m,1:m]);
    idx = sortperm(-abs.(H_eigvals));
    ritz_vals = H_eigvals[idx[1:k]]
    ritz_vecs = Q[:,1:end-1] * H_eigvecs[:,idx[1:k]]
    b = sum(ritz_vecs[:,1:k],dims=2);
    b = b[:];
    global b = b./norm(b);
    ritz_vals_vec[:,j] = ritz_vals;
end



figure(1)

for j = 1:k
plot(1:n_restart,real(ritz_vals_vec[j,:]))
end
xticks([0;collect(0:10:n_restart)])
savefig(string("task71_k10m20.png"))


figure(2)

for j = 1:k
plot(1:n_restart,imag(ritz_vals_vec[j,:]))
end
xticks([0;collect(0:10:n_restart)])
savefig(string("task72_k10m20.png"))

figure(3)
plot(real(B_eigvals),imag(B_eigvals),"bx")
plot(real(ritz_vals_vec[:,end]),imag(ritz_vals_vec[:,end]),"o",markerfacecolor="none", markeredgecolor="r")
xlabel("Re")
ylabel("Im")

legend(["Eigenvalues","Approximate eigenvalues"])
title("Eigenvalues of B")

savefig(string("task73_k10m20.png"))
