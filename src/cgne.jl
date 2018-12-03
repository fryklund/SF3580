using LinearAlgebra

function cgne(A::SparseMatrixCSC{Complex{Float64},Int64},b,k)
    x = zeros(size(b));
    r = A'*b;
    p = r
    for n = 1:k
        alpha = r'*r/(p'*A'*(A*p))
        x = x+alpha*p
        rnew = r-alpha*A'*(A*p)
        beta = (rnew'*rnew)/(r'*r)
        p = rnew+beta*p
        r = rnew
    end
    return x
end
