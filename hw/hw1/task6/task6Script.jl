include("../../../src/graham_scmidt_ortho.jl")
B=matread("Bwedge.mat")["B"];
A = [1 2;3 4;4 5];
Q,R = graham_schmidt_ortho(A)
Q*Q'
