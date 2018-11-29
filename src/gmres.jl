using LinearAlgebra
include("gs_methods.jl");
function gmres(A::SparseMatrixCSC{Complex{Float64},Int64},b::Array{Float64,1},m::Int64)
    n = length(b);
    normb = norm(b);
    q = b / normb;
    z = im*zeros(n);
    x = zeros(n);
    # Allocate space
    e1 = zeros(m+1,1);
    e1[1] = normb;
    Q=im*zeros(n,m+1)
    Q[:,1] = b ./ normb;
    H = im*zeros(m+1,m);
    r_log = zeros(m);
    for k = 1:m
        # Matrix-vector product
        #with last element
        w = A * Q[:,k];
        # Orthogonalize w against columns of Q
        h,beta,worth = doubleGS(Q,w,k)
        # Put Gram-Schmidt coefficients into H
        H[1:(k+1),k]=[h[1:k];beta];
        # Normalize
        Q[:,k+1]=worth./beta;
        # Solve least squares problem
        z[1:k] =  H[1:(k+1),1:k] \ e1[1:(k+1)];


        # Approximate solution
        x = Q[:,1:k] * z[1:k];
        # Compute residual
        r_log[k] = norm(A*x - b)/norm(b);
    end
    return x,r_log;
end
