# plotting the eigenvalues of a matrix
using PyCall, PyPlot, LinearAlgebra, Random

n=10
A=rand(n,n)
e=eigvals(A)

plot(real(e),imag(e),"*")
title("Spectum of the matrix A")
