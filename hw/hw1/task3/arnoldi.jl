using LinearAlgebra

#Random.seed!(0);
A=randn(100,100)
b = randn(100)

function arnoldiSGS(A,b,m::Number)
# % [Q,H]=arnoldi(A,b,m)
# % A simple implementation of the Arnoldi method.
# % The algorithm will return an Arnoldi "factorization":
# %   Q*H(1:m+1,1:m)-A*Q(:,1:m)=0
# % where Q is an orthogonal basis of the Krylov subspace
# % and H a Hessenberg matrix.
# %
# % Example:
# %  A=randn(100); b=randn(100,1);
# %  m=10;
# %  [Q,H]=arnoldi(A,b,m);
# %  should_be_zero1=norm(Q*H-A*Q(:,1:m))
# %  should_be_zero2=norm(Q'*Q-eye(m+1))

    n=length(b)

    Q=zeros(n,m+1)

    Q[:,1]=b./norm(b)

    H = zeros(m+1,m)

    t0=0
    t1=0

    for k=1:m
        w=A*Q[:,k]; # Matrix-vector product
                    #with last element
        println(Q)
        # Orthogonalize w against columns of Q
       # replace this with a orthogonalization
        h,beta,worth=tripleGS(Q,w,k);

        # Put Gram-Schmidt coefficients into H
        H[1:(k+1),k]=[h[1:k];beta];

        # normalize
        Q[:,k+1]=worth./beta;
    end
    return Q,H
end




m = 5
Q,H = arnoldiSGS(A,b,m)
println(opnorm(Q'*Q-I))
println(opnorm(Q*H-A*Q[:,1:m]))
