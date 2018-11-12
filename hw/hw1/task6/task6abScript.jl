using MAT
using LinearAlgebra
using PyCall
using PyPlot
using LaTeXStrings

B=matread("Bwedge.mat")["B"];
B_eigvals = eigvals(B);
t = 0:(2*pi/1000):2pi;
t = t[1:end-1];
c_1 = (-5 + 0.4*im) * ones(1000);
r_1 = 14;
circ_1 = c_1 + r_1 * exp.(t*im);
c_2 = (-23 -6*im) * ones(1000);
r_2 = 25;
circ_2 = c_2 + r_2 * exp.(t*im);
c_3 = (-23 + 9*im) * ones(1000);
r_3 = 26;
circ_3 = c_3 + r_3 * exp.(t*im);
println("Plotting")
figure()
plot(real(B_eigvals),imag(B_eigvals),"bx")
plot(real(B_eigvals[1:3]),imag(B_eigvals[1:3]),"rx")
plot(real(circ_1),imag(circ_1),"g-",linewidth=0.2)
plot(real(circ_2),imag(circ_2),"m-",linewidth=0.2)
plot(real(circ_3),imag(circ_3),"c-",linewidth=0.2)
xlabel("Re")
ylabel("Im")

legend(["Eigenvalues","Outmost eigenvalues","ε^{m}_{1}","ε^{m}_{2}","ε^{m}_{3}"])
title("Eigenvalues of B")
axis("equal")
savefig("task6a.png")

println((r_1/abs(B_eigvals[1]-c_1[1])))
println((r_2/abs(B_eigvals[2]-c_2[1])))
println((r_3/abs(B_eigvals[3]-c_3[1])))
