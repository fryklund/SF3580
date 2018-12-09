using LinearAlgebra,Random

function hessenberg_red(A)
#A naive inefficient way of carrying out
# the hessenberg reduction

    n=size(A,1)
    for k=1:n-2
        x= A[k+1:n,k]

        z= x-norm(x)*[1; zeros(n-k-1,1)]
        u= z/norm(z)

        A[k+1:n,k:n] = A[k+1:n,k:n]-2*u*(u'*A[k+1:n,k:n])
        A[1:n,k+1:n] = A[1:n,k+1:n]-2*(A[1:n,k+1:n]*u)*u'
    end
    H=A # should be a hessenberg matrix with same eigenvalues as input A
    return H
end
