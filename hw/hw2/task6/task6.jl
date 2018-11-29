using LinearAlgebra, SparseArrays,BenchmarkTools,MAT,Arpack,PyPlot,PyCall,LaTeXStrings


include("../../../src/cgne.jl")
include("../../../src/gmres.jl")

B=matread("Bwedge2.mat")["B"];
b=matread("Bwedge2.mat")["b"];

F = eigen(Matrix(B))
eig = F.values


x_ex = B\b;
bnorm = norm(b);



for k = 1:20
    println(k)
    global itr = k
    t_gmres = @belapsed gmres(B,b[:,1],itr)
    x,r_log = gmres(B,b[:,1],k)
    t_cg = @belapsed cgne(B,b[:,1],itr)
    x_cg = cgne(B,b[:,1],k)

    #figure(1)
    #semilogy(k,r_log[k]*bnorm,"r.")
    #semilogy(k,norm(x_ex[:,1].-x_cg),"b.")
    figure(2)
    semilogy(t_gmres,r_log[k]*bnorm,"r.")
    semilogy(t_cg,norm(x_ex[:,1].-x_cg),"b.")

end

figure(1)
xlabel("Iteration")
ylabel(L"$\|Ax-b\|_2$")
legend(["gmres","cgne"])
savefig("error_itr.png")
close(1)

figure(2)
xlabel("CPU-time (seconds)")
ylabel(L"$\|Ax-b\|_2$")
legend(["gmres","cgne"])
savefig("error_time.png")
close(2)



figure(3)
plot(real(eig),imag(eig),".")
xlabel("Real part of eigenvalues")
ylabel("Imaginary part of eigenvalues")
savefig("Eigens.png")
close(3)
