using LinearAlgebra
include("../../src/power_iteration.jl")
A = [1 2 3; 2 2 2; 3 2 9];
x = ones(3,1);
tol = 1e-4;
v,l = power_iteration(A,x,tol)
if l != nothing
    println(v)
    println(l)
end
