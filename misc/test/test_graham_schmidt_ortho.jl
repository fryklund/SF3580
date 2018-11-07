include("../../src/graham_scmidt_ortho.jl")
n = rand(1:10);
A = rand(2+n,n);
#A = [1 2 4; 2 2 2; 3 2 9]
Q,R = graham_schmidt_ortho(A);
println("n = ",n)
println("||Q|| = ", opnorm(Q,2))
println("||Q' * Q - I|| = ", opnorm(Q'*Q-one(Q'*Q),2))
println("det(Q' * Q) = ", det(Q'*Q))
println("||Q * R - A|| = ", opnorm(Q*R-A,2))
