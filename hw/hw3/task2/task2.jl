using LinearAlgebra, Random,PyPlot,PyCall
include("../../../src/qr_factorization.jl")


 function errfun(A)
     return maximum(maximum(abs.(tril(A,-1))))
 end

function alpha_example(alpha, m = 10)
    if alpha <= 0
        error("alpha must be positive");
    end
    # if (length(varargin)==0)
    #     m=10;
    # else
    #     m=varargin{1};
    # end

    #randn('state',0); #Detta är matlabkod - hur göra i julia?
    Random.seed!(0)
    a=2;
    d=(a.^(0.0:(m-1)));
    d[end-1]=d[end]*(0.99-1/(5*alpha));
    B=randn(m,m);

    A=B\(diagm(0 => d)*B);
    return A
end
figure()
k = 1:0.1:5
for j in k
    N = 10^j
    A = alpha_example(N,10)
    err = 1
    itr = 0
    while err>1e-10
        Q,R = qr_factorization(A)
        A = R*Q;
        err = errfun(A)
        itr = itr+1;
    end
    if j == 1
        semilogx(N,itr,"r.-",label = "number of iterations")
        semilogx(N,-10*log(10)/(log(0.99-1/(5*N))),"b.-",label = "predicted number of iterations")
    else
        semilogx(N,itr,"r.")
        semilogx(N,log(10^(-10))/(log(0.99-1/(5*N))),"b.-")
    end

end
legend(loc=8)
xlabel("alpha")
ylabel("iterations")
#legend("lower right",["number of iterations","predicted number of iterations"])

savefig("alpha.png")
