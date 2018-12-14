using LinearAlgebra, Random, SparseArrays, QuadGK

# Construct system matrices. Turns out we can do this as in Matlab with MatrixDepot package
A=matrixdepot("neumann",20);
A=A-A';
A=A./(2*norm(A,1));
B=sprandn(20^2,20^2, 0.05);

# Define the function G(t). exp acts as Matlabs expm. Neec Matrix() as A is sparse. This can be replaced with some other command that utilizes the sparsity.
function G(t)
    return exp(Matrix(t.*A'))*B*exp(Matrix(t.*A))
end

function integrateP(TOL = 1e-14)
    # Estimate the number of required iterations
    N = 1;
    while(1/factorial(N+2) > TOL)
            N = N+1;
    end
    println("Estimated #iterations: ", N)

    # Algorithm in (f)
    Gi = B
    P = B
    for i = 1:N
        Gi = *(Gi,A)-*(A,Gi)
        P += Gi/factorial(i+1);
    end
    err = 1/factorial(N+2)
    print("Estimated error: ",err)
    return P
end
timing  = time()
P = integrateP()
timing = time() - timing
println("\n")
println("Time for algorithm in (f): ",timing)
timing  = time()
Pquadgk,Errorquadgk = quadgk(G,0,1);
timing = time() - timing
println("Time for quadgk: ",timing)

println("Diff: ", norm(P-Pquadgk))
