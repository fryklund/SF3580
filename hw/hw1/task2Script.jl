using PyCall
using PyPlot
using LinearAlgebra
include("../../src/power_iteration.jl")
A = [1 2 3; 2 2 2; 3 2 9];
x = ones(3);
tol = 1e-12;
all_itr = true; # Set true if power_iteration is to return a iterations for the eigenvalue. Or leave blank
v,l = power_iteration(A,x,tol,all_itr)
if l == nothing
        exit()
end
println(v)
println(l[end])
if all_itr
    E = eigvals(A);
    l_true = E[argmax(abs.(E))];
    errorEval = abs.(l-l_true*ones(length(l)));
    println("Plotting")
    figure()
    semilogy(errorEval,"r-o");
    xlabel("Iteration number")
    ylabel("Error maximal eigenvalue")
    savefig("task2a.png")
end
