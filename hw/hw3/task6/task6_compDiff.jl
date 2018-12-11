using LinearAlgebra

function compDiff_exp(ε)
    g = z -> exp(z)
    A = [π 1; 0  π+ε]
    λ1,λ2 = eigvals(A)
    println("|λ1-λ2| = ", abs(λ1-λ2))
    Λ = Diagonal(exp.([λ1,λ2]))
    X = eigvecs(A)
    F = X * Λ * X^(-1)
    α = (g(λ1)λ2-g(λ2)λ1) / (λ2-λ1)
    β = (g(λ2) - g(λ1))/(λ2-λ1)
    p = z -> α*I + β*z
    f = p(A)
    # Equivalent expression
    # p = z -> g(λ1) .* I + g(λ1)/ε * (1 - g(ε)) * (π*I - z)
    return norm(f-F),norm(f-exp(A)),norm(F-exp(A))
end
