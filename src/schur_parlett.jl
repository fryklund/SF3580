using LinearAlgebra
function schur_parlett(A,f)
    T,Q,ev=schur(A)
    n = size(A,1)
    F = zeros(n,n)
    for i=1:n
        F[i,i]=f(T[i,i])
    end
    for p=1:n-1
        for i=1:n-p
            j=i+p
            s=T[i,j]*(F[j,j]-F[i,i])
            for k=i+1:j-1
                s = s + T[i,k]*F[k,j]-F[i,k]*T[k,j];
            end
            F[i,j]=s/(T[j,j]-T[i,i])
        end
    end
    F=Q*F*Q';
    return F
end
