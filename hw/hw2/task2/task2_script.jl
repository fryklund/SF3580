using PyCall
using PyPlot
using LinearAlgebra
using Random
using SparseArrays
using BenchmarkTools
include("../../../src/gmres.jl");
Random.seed!(0)

α = 1; m = 100;
α = 5; m = 60;
α = 10;  m = 30;
α = 100; m = 12;


M = 100;

A = sprand(M,M,0.5);
A = A + α * sparse(I,M,M);
A = A / norm(A,1);
b = rand(M);
x,r_log = gmres(A,b,m);
