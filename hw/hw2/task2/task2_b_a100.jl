using Plots
using LinearAlgebra
using Random
using SparseArrays
using BenchmarkTools
using LaTeXStrings
gr() #Backend
include("../../../src/gmres.jl");
M = 100;



α = 100; m = 12;
title_string =  "\\alpha =  $α"
Random.seed!(0)
A = sprand(M,M,0.5);
A = A + α * sparse(I,M,M);
A = A / norm(A,1);
b = rand(M);
x,r_log = gmres(A,b,m);
# Estimate rate of convergence
λ = eigvals(Matrix(A));
λ_r_max = maximum(real(λ[1:end]));
λ_r_min = minimum(real(λ[1:end]));
λ_i_max = maximum(imag(λ[1:end]));
λ_i_min = minimum(imag(λ[1:end]));
c_r = (λ_r_max + λ_r_min) / 2;
c_i = (λ_i_max + λ_i_min) / 2;
c = c_r + im * c_i;
r_r = maximum(abs.(real(λ[1:end]).-c_r))
r_i = maximum(abs.(imag(λ[1:end]).-c_i))
r = max(r_r,r_i) + 0.00002;
absc = sqrt(c_r^2 + c_i^2);
conv_rate = (r/absc).^(1:length(r_log));
plot(real(λ),imag(λ),seriestype=:scatter,label=["\\lambda" "C(c,\\rho )"])
t = collect(0:2*pi/1000:2*pi);
circ = c_r .+ im .* c_i .+ r.*exp.(im*t);
plot!(real(circ),imag(circ),xlims = (0.0075,0.0105),ylims = (-0.0015,0.0015),label=["C ( c,\\rho )" "\\lambda"],title= title_string)

savefig("Task2_b_a100_1.png")
## Plot r_log



λ_r_max_2 = maximum(real(λ[2:end]));
λ_r_min_2 = minimum(real(λ[2:end]));
λ_i_max_2 = maximum(imag(λ[2:end]));
λ_i_min_2 = minimum(imag(λ[2:end]));
c_r_2 = (λ_r_max_2 + λ_r_min_2) / 2;
c_i_2 = (λ_i_max_2 + λ_i_min_2) / 2;
c_2 = c_r_2 + im * c_i_2;
r_r_2 = maximum(abs.(real(λ[2:end]).-c_r_2))
r_i_2 = maximum(abs.(imag(λ[2:end]).-c_i_2))
r_2 = max(r_r_2,r_i_2) + 0.00002;
ρ = sqrt(r_2*(r+abs(c_2-λ[1]))/(abs(λ[1])*abs(c_2)))
conv_rate_2 = ρ.^((1:length(r_log)).-1);
plot(real(λ),imag(λ),seriestype=:scatter,label=["\\lambda" "C(c,\\rho )"])
t = collect(0:2*pi/1000:2*pi);
circ = c_r .+ im .* c_i .+ r.*exp.(im*t);
circ_2 = c_2 .+  r_2.*exp.(im*t);
plot!(real(circ_2),imag(circ_2),xlims = (0.0075,0.0105),ylims = (-0.0015,0.0015),label=["C ( c,\\rho )" "\\lambda"],title= title_string)
savefig("Task2_b_a100_2.png")
## Plot r_log
plot(1:length(r_log),log.(10,r_log),label=["|| Ax - b||" "ssssss" "q2qw"],legend=:bottomleft)
plot!(1:length(conv_rate_2),log.(10,conv_rate_2./10),label=["2 discs"],legend=:bottomleft)
plot!(1:length(conv_rate),log.(10,conv_rate),title= title_string,xticks = 0:10:length(r_log),ylims = (-15,1),label=["1 disc" "|| Ax - b||" "ssssss" "q2qw"],legend=:bottomleft)
xlabel!("#iterations")
ylabel!("Absolute error")
savefig("Task2_ab_a100_conv.png")
