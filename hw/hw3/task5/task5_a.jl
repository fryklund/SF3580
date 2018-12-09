using LinearAlgebra
# include("../../../src/schur_parlett.jl");
include("../../../src/schur_parlett.jl")

# Construct system matrix A
A = [1 4 5;3 -1 3;-1 4 5]
# Define function f
fs = x ->sin(x)
Fs = schur_parlett(A,fs)

fc = x ->cos(x)
Fc = schur_parlett(A,fc)


# Compute solution
D = Diagonal(eigvals(A))
Q = eigvecs(A)
# Check
println(norm(Fs-Q*fs.(D)*Q^(-1)))
# Check for non-diagonalizable matrices
println(norm(Fc*Fc+Fs*Fs - I))
