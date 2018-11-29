using Plots
using LinearAlgebra
using Random
using SparseArrays
using BenchmarkTools
using LaTeXStrings
gr() #Backend
include("../../../src/gmres.jl");
M = 100;

# # α = 1
# Random.seed!(0)
# α = 1; m = M;
# A = sprand(M,M,0.5);
# A = A + α * sparse(I,M,M);
# A = A / norm(A,1);
# b = rand(M);
# x,r_log = gmres(A,b,m);
#
# # Estimate rate of convergence
#
#
# title_string =  "\\alpha =  $α"
# plot(1:length(r_log),log.(10,r_log),title= title_string,label=["|| Ax - b||"],xticks = 0:10:length(r_log),ylims = (-15,1),legend=:bottomleft)
# xlabel!("#iterations")
# ylabel!("Absolute error")
# savefig("Task2_a_a1.png")
#
# # α = 5
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
# # α = 10
# α = 10;  m = 30;
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

# α = 100
# α = 100; m = 12;
# Random.seed!(0)
# A = sprand(M,M,0.5);
# A = A + α * sparse(I,M,M);
# A = A / norm(A,1);
# b = rand(M);
# x,r_log = gmres(A,b,m);
# # Estimate rate of convergence
# λ = eigvals(Matrix(A));
# λ_r_max = maximum(real(λ));
# λ_r_min = minimum(real(λ));
# λ_i_max = maximum(imag(λ));
# λ_i_min = minimum(imag(λ));
# c_r = (λ_r_max + λ_r_min) / 2;
# c_i = (λ_i_max + λ_i_min) / 2;
# r_r = maximum(abs.(real(λ).-c_r))
# r_i = maximum(abs.(imag(λ).-c_i))
# r = max(r_r,r_i) + 0.00002;
# absc = sqrt(c_r^2 + c_i^2);
# conv_rate = (r/absc).^(1:length(r_log));
# plot(real(λ),imag(λ),seriestype=:scatter)
# t = collect(0:2*pi/1000:2*pi);
# circ = c_r .+ im .* c_i .+ r.*exp.(im*t);
# plot!(real(circ),imag(circ),xlims = (0.0075,0.0105),ylims = (-0.0015,0.0015))
# savefig("Task2_b_a100.png")
# ## Plot r_log
# title_string =  "\\alpha =  $α"
# plot(1:length(r_log),log.(10,r_log))
# plot!(1:length(conv_rate),log.(10,conv_rate),title= title_string,label=["|| Ax - b||"],xticks = 0:10:length(r_log),ylims = (-15,1),legend=:bottomleft)
# xlabel!("#iterations")
# ylabel!("Absolute error")
# savefig("Task2_ab_a100.png")


α = 100; m = 12;
Random.seed!(0)
A = sprand(M,M,0.5);
A = A + α * sparse(I,M,M);
A = A / norm(A,1);
b = rand(M);
x,r_log = gmres(A,b,m);
# Estimate rate of convergence
λ = eigvals(Matrix(A));
λ_r_max = maximum(real(λ));
λ_r_min = minimum(real(λ));
λ_i_max = maximum(imag(λ));
λ_i_min = minimum(imag(λ));
c_r = (λ_r_max + λ_r_min) / 2;
c_i = (λ_i_max + λ_i_min) / 2;

ρ =

r_r = maximum(abs.(real(λ).-c_r))
r_i = maximum(abs.(imag(λ).-c_i))
r = max(r_r,r_i) + 0.00002;
absc = sqrt(c_r^2 + c_i^2);
conv_rate = (r/absc).^(1:length(r_log));
plot(real(λ),imag(λ),seriestype=:scatter)
t = collect(0:2*pi/1000:2*pi);
circ = c_r .+ im .* c_i .+ r.*exp.(im*t);
plot!(real(circ),imag(circ),xlims = (0.0075,0.0105),ylims = (-0.0015,0.0015))
savefig("Task2_b_a100.png")
## Plot r_log
title_string =  "\\alpha =  $α"
plot(1:length(r_log),log.(10,r_log))
plot!(1:length(conv_rate),log.(10,conv_rate),title= title_string,label=["|| Ax - b||"],xticks = 0:10:length(r_log),ylims = (-15,1),legend=:bottomleft)
xlabel!("#iterations")
ylabel!("Absolute error")
savefig("Task2_ab_a100.png")
