using Plots
using LinearAlgebra
using Random
using SparseArrays
using BenchmarkTools
using LaTeXStrings
include("../../../src/gmres.jl");

# # α = 1
m = 1000;
n = 6;
α = 100;
Random.seed!(0)
A = sprand(m,m,0.5);
A = A + α * sparse(I,m,m);
A = A / norm(A,1);
b = rand(m);

println(m)
println(n)
################################################################
println("GMRES")
bench_gmres = @benchmarkable gmres(A,b,n);
tune!(bench_gmres);
bench_gmres_timings = run(bench_gmres)
x_gmres = gmres(A,b,n);
resnorm_gmres = norm(A*x_gmres - b);
################################################################
println("Backslash")
bench_bs = @benchmarkable A\b;
tune!(bench_bs);
bench_bs_timings = run(bench_bs);
x_bs = A\b;
resnorm_bs = norm(A*x_bs - b);
