using BenchmarkTools, Random, LinearAlgebra, SparseArrays

# diagonal matrices
A=diagm(1 => [1,2,3], -1 => [4,5,6])
B=diagm(0 => [1,2,3,4], 2 => [4,5])

# sparse diagonal matrices
As = spdiagm(-1 => [1,2,3,4], 1 => [4,3,2,1])
n=100
Bs = spdiagm(-1 => ones(n-1), 0 => -2*ones(n), 1 => ones(n-1))
# spy is in SparseArrays
spy(Bs)