using LinearAlgebra
include("../../../src/qr_factorization.jl")

# pot = [-1:-1:-10]
# ep = [10.0^k for k in pot]
# ep = [0.4 ep]
# print(ep)
sigma = 1
for i = 1:11
    if i == 1
        ep =0.4
    else
        ep = 10.0^(-i)
    end
    A = [3 2; ep 1]
    Q,R = qr(A-sigma*I)
    H = R*Q+sigma*I
    print(abs(H[2,1]))
    print("\n")
end
