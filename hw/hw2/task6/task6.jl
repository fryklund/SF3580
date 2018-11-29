using LinearAlgebra, SparseArrays,BenchmarkTools,MAT,Arpack,PyPlot,PyCall
include("../../../src/cg.jl")
include("../../../src/gmres.jl")

B=matread("Bwedge2.mat")["B"];
b=matread("Bwedge2.mat")["b"];

F = eigen(Matrix(B))
eig = F.values

println(typeof(B))
println(typeof(b[:,1]))
x,r_log = gmres(B,b[:,1],2)
#Problemet är här att gmres inte kan ta en komplexvärd matris!


figure()
for k = 1:100
    #x,r_log = gmres(B,b,k)
    semilogy(k,r_log,'.')
    x = cg(B,b[:,1],2)
end
xlabel("Real part of eigenvalues")
ylabel("Imaginary part of eigenvalues")
savefig("Eigens.png")


figure()
plot(real(eig),imag(eig),".")
xlabel("Real part of eigenvalues")
ylabel("Imaginary part of eigenvalues")
savefig("Eigens.png")

#x,r_log =
