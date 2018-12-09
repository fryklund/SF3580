using LinearAlgebra
using Random
using BenchmarkTools
using LaTeXStrings
using Plots
using Statistics
# include("../../../src/schur_parlett.jl");
include("../../../src/schur_parlett.jl")
include("naive_power.jl")
N = 300
# Construct system matrix A
A = rand(100,100)
# Define function f
f = x -> x^N

println("N = ", N)
################################################################
println("SCHUR-PARLETT")
bench_schur_parlett = @benchmarkable schur_parlett(A,f);
tune!(bench_schur_parlett);
bench_schur_parlett_timings = run(bench_schur_parlett)

################################################################
println("NAIVE")
bench_naive = @benchmarkable naive_power(A,N);
tune!(bench_naive);
bench_naive_timings = run(bench_naive)


println("SP:", mean(bench_schur_parlett_timings))
println("N:", mean(bench_naive_timings))
