using LinearAlgebra, MAT, SparseArrays, Random,QuadGK
#using Pkg; Pkg.add("QuadGK")

#Comment: The inbuilt integration does not work yet!
# function G(t,)
#     A=matread("task7matrix.mat")["A"];
#     B = sprand(size(A,1),size(A,2),0.05);
#     A = Matrix(A)
#     return exp(t*A')*B*exp(t*A)
# end
#
# t = 1;
# int = quadgk(G,0,t)

#Denna del fungerar inte heller än om t = 1. Funkar ev om t<1.
#Har ibland svårt att läsa in matrisen. Varför?? Försöker specificera filens sökväg.
function integrateP()
    A = matread("task7matrix.mat")["A"]; #Reads the matrix A
    B = sprand(size(A,1),size(A,2),0.05)
    A = Matrix(A)
    G = B
    P = zeros(size(A,1),size(A,1))
    i = 1
    err = 1
    t = 1
    tol = 10^(-4)
    tau = 0.5 #This is to be changed to one!
    while abs(err)>tol
        print(size(P))
        print(i)
        print("\n")
        G = G*A-A*G
        t = t*tau/i
        P = P+G*t
        i = i+1
        err = opnorm(Matrix(B))*t*tau/(i*(1-tau))
        #Obs, this line must be modified:
        #err = opnorm(Matrix(B))*(exp(1)-(1/(factorial(i-1))))
        print(err)
    end
    return P
end

P = integrateP()
#print(P)
