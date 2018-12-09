using LinearAlgebra, Random,PyPlot,PyCall,BenchmarkTools
include("../../../src/hessenberg_red.jl")
include("naive_hessenberg.jl")
include("../task2/task2.jl")

N = [10 100 200 300 400]
for k in N
    global A = alpha_example(1, k)
    th = @belapsed hessenberg_red(A)
    tn = @belapsed naive_hessenberg_red(A)
    print("naive")
    print(tn)
    print("....improved")
    print(th)
    print("\n")
end
