using MAT
using LinearAlgebra
using PyCall
using PyPlot

include("../../../src/graham_scmidt_ortho.jl")
B=matread("Bwedge.mat")["B"];
B_eigvals = eigvals(B);

println("Plotting")
figure()
plot(real(B_eigvals),imag(B_eigvals),"bo")
plot(real(B_eigvals[1:3]),imag(B_eigvals[1:3]),"ro")
xlabel("Re")
ylabel("Im")
title("Eigenvalues of B")

savefig("task6a.png")
