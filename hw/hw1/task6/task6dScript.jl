using MAT
using LinearAlgebra
using PyCall
using PyPlot
using LaTeXStrings

B=matread("Bwedge.mat")["B"];

σ = -11 + im * 2;

B = inv(B-σ*I)
B_eigvals = eigvals(B);
println("Plotting")
figure()
plot(real(B_eigvals),imag(B_eigvals),"bx")
plot(real(B_eigvals[1:3]),imag(B_eigvals[1:3]),"rx")
xlabel("Re")
ylabel("Im")
legend(["Eigenvalues","Outmost eigenvalues"])

title("Eigenvalues of (B-σI)^{-1} ")
savefig("task6d.png")
