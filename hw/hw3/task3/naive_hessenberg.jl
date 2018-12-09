using LinearAlgebra,Random

function naive_hessenberg_red(A)
#A naive inefficient way of carrying out
# the hessenberg reduction

    n=size(A,1)
    for k=1:n-2
        x= A[k+1:n,k]

        z= x-norm(x)*[1; zeros(n-k-1,1)]
        u= z/norm(z)
        P1=I-2*u*u'
        #P#0=eye(k)
        P=[I zeros(k,n-k); zeros(n-k,k) P1]  # Equation (3.5) in
                                               # lecture notes

        PA=P*A
        # PA should have zeros below the second off-diagonal in column
        # k as described on page 6 in lecture notes.
        A=PA*P'
        # A should have the same zero-structure as PA

    end
    H=A # should be a hessenberg matrix with same eigenvalues as input A
    return H
end

# A = rand(10,10)
# eigs = eigen(A)
# H  = naive_hessenberg_red(A)
# eigsH = eigen(H)
#
# print(abs.(eigs.values-eigsH.values))
