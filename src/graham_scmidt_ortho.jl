function graham_schmidt_ortho(A)
# R = Q*A
# Q' *  Q = Q * Q' = I
# QR-decomposition: A = Q'*R
    (n_row,n_col) = size(A);
    # Check if A has the correct structure
    if n_col > n_row
        println("ERROR: number of columns > number of rows")
        println("return")
        return nothing,nothing
    end
    # Graham Scmidt orthogonalization
    Q = zeros(n_row,n_col)
    R = zeros(n_col,n_col)
    R[1,1] = norm(A[:,1])
    #v = zeros(n_row)
    for i = 1:n_col
        v = A[:,i];
        for j=1:(i-1)
            R[j,i] = Q[:,j]' * A[:,i];
            v = v - R[j,i] * Q[:,j];
        end
        R[i,i] = norm(v);
        Q[:,i] = v / R[i,i];
    end
    return Q,R
end
