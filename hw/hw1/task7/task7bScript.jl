using MAT
using LinearAlgebra
using PyCall
using PyPlot
using LaTeXStrings
using Random

include("../../../src/myarnupd.jl")
#Random.seed!(1234);
B=matread("Bwedge.mat")["B"];
B_eigvals = eigvals(B);
B_eigvecs = eigvecs(B);
b = randn(size(B,1))
b = b./norm(b);
k =5
p = 10;
m = 10;
V,H,r,ritz_vals = arnupd(B,k,p,m,1e-10,b);


n_restart = size(ritz_vals_vec,2)


figure(1)

for j = 1:k
    plot(1:10,real(ritz_vals_vec[j,:]))
end
# xticks([0;collect(1:5:m)])
savefig(string("task7b1_k10m10p10.png"))


figure(2)

for j = 1:k
    plot(1:10,imag(ritz_vals_vec[j,:]))
end
# xticks([0;collect(0:5:m)])
savefig(string("task7b2_k10m10p10.png"))

figure(3)
plot(real(B_eigvals),imag(B_eigvals),"bx")
plot(real(ritz_vals_vec[:,end]),imag(ritz_vals_vec[:,end]),"o",markerfacecolor="none", markeredgecolor="r")
xlabel("Re")
ylabel("Im")

legend(["Eigenvalues","Approximate eigenvalues"])
title("Eigenvalues of B")

savefig(string("task7b3_k10m10p10.png"))
