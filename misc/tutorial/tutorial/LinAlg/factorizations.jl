# see slide
using Random, LinearAlgebra

n=100
b=rand(n)
A=rand(n,n)
# solve a linear system
@time x=A\b
A=factorize(A);
# solve the same linear system after the factorization
@time x=A\b

A=rand(n,n)
A=A'*A
# solve a linear system with A positive definite
# This is faster, you will see why in the course
@time x=A\b
A=factorize(A);
# solve a linear system with A positive def with factorization
@time x=A\b
1
