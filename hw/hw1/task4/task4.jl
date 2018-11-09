using LinearAlgebra,Random,PyPlot,PyCall,MatrixDepot

include("../../../src/arnoldiDGS.jl")

Random.seed!(0)

n = 12#20#determines size of matrix A
A=matrixdepot("wathen",n,n)
b = randn(size(A,1))

function krylovMatrix(A,b,m)
    #Creates a krylov matric K by applying the power method
    K = b./norm(b)
    for i = 1:m-1
        K = [K A*K[:,i]./norm(A*K[:,i])]
    end
    return K
end

figure()
for m = 1:80
    K = krylovMatrix(A,b,m)
    K_eig = eigen(K'K\(K'*A*K))

    Q,H = arnoldiGS(A,b,m)
    eig = eigen(H[1:m,1:m])

    plot(m.*ones(m),real(K_eig.values),"r+-")
    plot(m.*ones(m),real(eig.values),"k.-")
end
ylim(-500,500)
xlabel("m")
ylabel("Real part of eigenval. approximation")
savefig("eigenArnoldi.png")
