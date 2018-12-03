using LinearAlgebra, SparseArrays,BenchmarkTools,MAT,Arpack,PyPlot,PyCall,LaTeXStrings


include("../../../src/cgne.jl")
include("../../../src/gmres.jl")

B=matread("Bwedge2.mat")["B"];
b=matread("Bwedge2.mat")["b"];

F = eigen(Matrix(B))
eig = F.values
vcond = cond(F.vectors)
println(vcond)

x_ex = B\b;
bnorm = norm(b);
global c1 = 36.5
global r1 = 20
global c2 = eig[1]
global a = maximum(abs.(c2.-eig))
println("a")
println(a)
println(sqrt(r1*(r1+abs(c1-c2))/abs(c1*c2)))

global c = 36.1#30;
global r = 20.5#28
println(r/abs(c))





for k = 1:100
    println(k)
    global itr = k
    #t_gmres = @belapsed gmres(B,b[:,1],itr)
    x,r_log = gmres(B,b[:,1],k)
    #t_cg = @belapsed cgne(B,b[:,1],itr)
    x_cg = cgne(B,b[:,1],k)
    co = cond(Matrix(B'*B))

    figure(1)
    semilogy(k,r_log[k]*bnorm,"r.")
    semilogy(k,norm(x_ex[:,1].-x_cg),"b.")
    #semilogy(k,vcond*(sqrt(r1*(r1+abs(c1-c2))/abs(c1*c2)))^(k-1),"k.")
    semilogy(k,vcond*a*(r/abs(c))^(k-1),"k.")
    semilogy(k,2*((sqrt(co)-1)/(sqrt(co)+1))^k,"g.")
    #figure(2)
    #semilogy(t_gmres,r_log[k]*bnorm,"r.")
    #semilogy(t_cg,norm(x_ex[:,1].-x_cg),"b.")


end

figure(1)
xlabel("Iteration")
ylabel(L"$\|Ax-b\|_2$")
legend(["gmres","cgne","gmres convergence bound","cgne convergence bound"])
savefig("error_itr2.png")
close(1)

#figure(2)
#xlabel("CPU-time (seconds)")
#ylabel(L"$\|Ax-b\|_2$")
#legend(["gmres","cgne"])
#savefig("error_time.png")
#close(2)



figure(3)
plot(real(eig),imag(eig),".")
t = 0:0.01:2*pi
plot(c.+r*cos.(t),r*sin.(t))
xlabel("Real part of eigenvalues")
ylabel("Imaginary part of eigenvalues")
savefig("Eigens2.png")
close(3)
