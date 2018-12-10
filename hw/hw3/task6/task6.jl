using LinearAlgebra
using Plots
gr()

include("task6_compDiff.jl")

errV = zeros(100)

for i = 1:100
    ε = 10.0^(-i/10)
    errV[i] = compDiff_exp(ε)
    println(ε)
end
plot(collect(-10:0.1:-0.1),log.(10,errV))
