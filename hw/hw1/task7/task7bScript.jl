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
b = ones(size(B,1))
b = b./norm(b);
k = 10
p = 20;
m = 16;
V,H,r,ritz_vals_vec = myarnupd(B,k,p,m,1e-10,b);


n_restart = size(ritz_vals_vec,2)


figure(1)

for j = 1:k
    plot(1:m,real(ritz_vals_vec[j,:]))
end
xlabel("Restarts")
ylabel("Real part of eigenvalue approximation")
#savefig(string("task7b1_k5m10p10.png"))
savefig(string("task7b1_k10m16p20.png"))


figure(2)

for j = 1:k
    plot(1:m,imag(ritz_vals_vec[j,:]))
end
xlabel("Restarts")
ylabel("Imaginary part of eigenvalue approximation")
#savefig(string("task7b2_k5m10p10.png"))
savefig(string("task7b2_k10m16p20.png"))
figure(3)
plot(real(B_eigvals),imag(B_eigvals),"bx")
plot(real(ritz_vals_vec[:,end]),imag(ritz_vals_vec[:,end]),"o",markerfacecolor="none", markeredgecolor="r")
xlabel("Re")
ylabel("Im")

legend(["Eigenvalues","Approximate eigenvalues"])
title("Eigenvalues of B")

#savefig(string("task7b3_k5m10p10.png"))
savefig(string("task7b3_k10m16p20.png"))
close("all")
