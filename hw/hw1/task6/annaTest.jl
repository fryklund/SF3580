using LinearAlgebra, Random,PyPlot,PyCall
include("../../../src/arnoldi_IS_DGS_complex.jl")
#using Pkg; Pkg.add("MAT")
using MAT
A=matread("Bwedge.mat")["B"];
n = size(A,1)
σ = -11+2*im
b = rand(size(A,1))
b = b./norm(b)
m = 10

Q,H = arnoldi_IS_DGS_complex(A,b,m,σ)
eigA=eigvals(A)

eigB = ones(n)./(eigA.-σ) #according to formula
# eigB = eigB[1:3];
eigBB = eigvals(inv(A-σ*I))
# eigBB = eigBB[1:3];
figure()
#plot(real(eigA),imag(eigA),"b+")
plot(real(eigB),imag(eigB),"g*")
plot(real(eigBB),imag(eigBB),"k+")

eigH=eigvals(H[1:m,1:m])
plot(real(eigH),imag(eigH),"r.")

savefig("eigB.png")
