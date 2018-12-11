using LinearAlgebra
using Plots
using LaTeXStrings
gr()

include("task6_compDiff.jl")

errV = zeros(100,3)

for i = 1:100
    ε = 10.0^(-i/10)
    errV[i,1],errV[i,2],errV[i,3] = compDiff_exp(ε)
    println(ε)
end



y = [log.(10,errV[:,1]) log.(10,errV[:,2]) log.(10,errV[:,3])]
title_string = "asd"
plot(collect(-10:0.1:-0.1),y, label=["||f(A)-F||" "|||f(A)- expm(A)|" "|||F- expm(A)|"],legend=:bottomright,xlabel="epsilon",ylabel="norm")
savefig("Task6.png")
