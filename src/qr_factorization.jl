
function qr_factorization(A::Matrix)
# Q*R = A
# Q' *  Q = Q * Q' = I
    (n_row,n_col) = size(A);
    # Check if A has the correct structure
    if n_col > n_row
        println("ERROR: number of columns > number of rows")
        println("return")
        return nothing,nothing
    end
    # Graham Scmidt orthogonalization
    Q = copy(A);
    R = zeros(n_col,n_col)
    for i = 1:n_col
        R[1:i-1,i] = Q[:,1:i-1]' * Q[:,i];
        Q[:,i] = Q[:,i] - Q[:,1:i-1] * R[1:i-1,i];
        R[i,i] = norm(Q[:,i]);
        Q[:,i] = Q[:,i] / R[i,i];
    end
    return Q,R
end
