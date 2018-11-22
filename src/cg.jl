using LinearAlgebra

function cg(A,b,k)
    x = zeros(size(b));
    r = b;
    p = r
    for n = 1:k
        alpha = r'*r/(p'*A*p)
        x = x+alpha*p
        rnew = r-alpha*A*p
        beta = (rnew'*rnew)/(r'*r)
        p = rnew+beta*p
        r = rnew
    end
    return x
end
