using Plots
using LinearAlgebra
using Random
using SparseArrays
using BenchmarkTools
using LaTeXStrings
gr() #Backend
include("../../../src/gmres.jl");
M = 100;
# # α = 5l
# α = 5; m = 60;
# Random.seed!(0)
# A = sprand(M,M,0.5);
# A = A + α * sparse(I,M,M);
# A = A / norm(A,1);
# b = rand(M);
# x,r_log = gmres(A,b,m);
# ## Plot r_log
# title_string =  "\\alpha =  $α"
# plot(1:length(r_log),log.(10,r_log),title= title_string,label=["|| Ax - b||"],xticks = 0:10:length(r_log),ylims = (-15,1),legend=:bottomleft)
# xlabel!("#iterations")
# ylabel!("Absolute error")
# savefig("Task2_a_a5.png")
#
# # α = 100
# α = 100;  m = 12;
# Random.seed!(0)
# A = sprand(M,M,0.5);
# A = A + α * sparse(I,M,M);
# A = A / norm(A,1);
# b = rand(M);
# x,r_log = gmres(A,b,m);
# ## Plot r_log
# title_string =  "\\alpha =  $α"
# plot(1:length(r_log),log.(10,r_log),title= title_string,label=["|| Ax - b||"],xticks = 0:10:length(r_log),ylims = (-15,1),legend=:bottomleft)
# xlabel!("#iterations")
# ylabel!("Absolute error")
# savefig("Task2_a_a10.png")
