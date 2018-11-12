using PyCall
using PyPlot
using LinearAlgebra

include("../../../src/power_iteration.jl")
include("../../../src/rayleigh_quotient.jl")

A = [1 2 3; 2 2 2; 3 2 9];
E_A = eigvals(A);
x0 = ones(3);

tol = 1e-10;
#############################
#########     a   ###########
#############################
println("2.a: Power iteration")
tol_pi = 1e-10;
all_itr_pi = true; # Set true if power_iteration is to return a iterations for the eigenvalue. Or leave blank
v_pi,l_pi = power_iteration(A,x0,tol,all_itr_pi)
if l_pi != nothing
println(v_pi)
println(l_pi[end])
if all_itr_pi
    n_pi = length(l_pi);
    l_max = E_A[argmax(abs.(E_A))];
    error_pi = abs.(l_pi-l_max*ones(n_pi)) +  ones(n_pi) * 10^(-14);
    println("Plotting")
    figure()
    semilogy(1:n_pi,error_pi,"r-o");
end
end
println(" ")
#############################
#     SETUP FOR REYLEIGH QUOTIENT
#mu0 = 20;
tol_rq = 1e-12;
all_itr_rq = true; # Set true if power_iteration is to return a iterations for the
B = [1 2 4; 2 2 2; 3 2 9];
E_B = eigvals(B);
tol_rq = 1e-12;
all_itr_rq = true; # Set true if power_iteration is to return a iterations for the

#############################
#########     b   ###########
#############################
println("2.b: Rayleigh quotient")
v_rq,l_rq = rayleigh_quotient(A,x0,mu0,tol_rq,all_itr_rq);
if l_rq != nothing
println(v_rq)
println(l_rq[end])
if all_itr_rq
    n_rq = length(l_rq);
    l_sim_rq = E_A[argmin(abs.(E_A-l_rq[end]*ones(3)))]
    error_rq = abs.(l_rq-l_sim_rq * ones(n_rq)) + ones(n_rq) * 10^(-14);
    println("Plotting")
    semilogy(1:n_rq,error_rq,"g-+");
end
end

println(" ")
#############################
#########     c   ###########
#############################
println("2.c: Rayleigh quotient with non-symmetric A")
# Only symmetric part is present in Rayleigh quotient. A = 0.5 * (A+A') + 0.5 * (A-A')
# x0'*B*x0 - x0' * (0.5*(B+B'))*x0
v_rq,l_rq = rayleigh_quotient(B,x0,mu0,tol_rq,all_itr_rq);
if l_rq != nothing
println(v_rq)
println(l_rq[end])
if all_itr_rq
    n_rq = length(l_rq);
    l_sim_rq = E_B[argmin(abs.(E_B-l_rq[end]*ones(3)))]
    error_rq = abs.(l_rq-l_sim_rq * ones(n_rq)) +  + ones(n_rq) * 10^(-14);
    println("Plotting")
    semilogy(1:n_rq,error_rq,"c-*");
    xlabel("Iteration number")
    ylabel("Error maximal eigenvalue")
    #title("Rayleigh quotient for non-symmetric matrix")
    xticks(1:n_pi)
    legend(["Power method","Rayleigh: A symmetric","Rayleigh: A  nonsymmetric"])
    savefig("task2.png")
end
end
println(" ")
