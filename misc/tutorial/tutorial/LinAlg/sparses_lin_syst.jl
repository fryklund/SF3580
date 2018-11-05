using Random, LinearAlgebra, SparseArrays

# create a sparse matrix
n=1000
dm=ones(n-1)
dp=ones(n-1)
d0=-2*ones(n)
A=spdiagm(-1=>dm,0=>d0,1=>dp)
b=rand(n)
@time x1=A\b;

# Matrix() covert to full matrix
A_full=Matrix(A);

@time x2=A_full\b
norm(x1-x2)
