using LinearAlgebra, Optim, SparseArrays
include("../../../src/cg.jl")
include("../../../src/gmres.jl")

c = ones(8)
A = diagm(0 => 2*ones(8), -1 => ones(7), 1=> ones(7));
A[3,2] = -1.0
A[2,3] = -1
b = zeros(8);
b[1]= 1;
b[2] = 1


alpha=0; beta=-1; gamma=6;
C=[1 alpha 0 gamma
1 0 beta 0
0 1 0 0
0 0 1 7
0 0 0 1
0 0 0 0
0 0 0 0
0 0 0 0];

r(z) = (A*C*z-b)'*(A\(A*C*z-b)) #This is what we need to replace ??? with for CG

result = optimize(r, [1.0; 1; 1; 1], BFGS())
z=result.minimizer
x_opt = C*z;
m = 4
x_cg=cg(A,b,m);
println(norm(x_cg-x_opt))

A = sparse(A)
x_gmres,r_log = gmres(A,b,m)
r(z) = (A*C*z-b)'*(A*C*z-b) #This is what we need to replace ??? with for GMRES
result = optimize(r, [1.0; 1; 1; 1], BFGS())
z=result.minimizer
x_opt = C*z;

println(norm(x_opt-x_gmres))
