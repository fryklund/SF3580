using MAT
using LinearAlgebra
using PyCall
using PyPlot
using LaTeXStrings

include("../../../src/arnoldi.jl")

B=matread("Bwedge.mat")["B"];
B_eigvals = eigvals(B);
b = rand(length(B_eigvals))
m = 10;
 Q,H = arnoldi(B,b,m);
