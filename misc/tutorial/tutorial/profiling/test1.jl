using BenchmarkTools, Random, LinearAlgebra

n=100
b=rand(n)
A=rand(n,n)
# solve a linear system
@btime x=A\b
A=factorize(A);
# solve the same linear system after the factorization
@btime x=A\b

A=rand(n,n)
A=A'*A
# solve a linear system with A positive definite
# This is faster, you will see why in the course
@btime x=A\b
A=factorize(A);
# solve a linear system with A positive def with factorization
@btime x=A\b
1
