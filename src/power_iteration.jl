#todo: Which norm to use? Don't think it matters.

function power_iteration(A,x,tol,l_exact=nothing)
    # Input
    # A: matrix to perform power method on
    # x: starting vector
    # tol: tolerance
    # Output
    # v: approximation of eigenvector correpsonding to largest eigenvalue of A
    # l: approximation of the largest eigenvalue of A

    # If no convergence within itr_max iterations nothing is return as values for l and v.

    v = x / norm(x); # Normalize starting vector
    itr_max = 100; # Maximum allowed number of iterations
    l = 1; # Dummy
    itr = 0; # Iteration counter
    v_old = v; # save previous values
    l_old = l; # save previous values

    if l_exact == nothing
        while itr < itr_max
            w = A * v;
            v = w / norm(w);
            l = reshape(v' * A * v,1)[1];
            itr += 1;
            if (abs(l-l_old) < tol) && (norm(v-v_old)<tol) # If max_itr has been reached or if both eigenvector and eigenvalue are  within
                return v,l
            end
            v_old = v;
            l_old = l;
        end
        println("Did not converge within ",itr_max," iterations.")
        return nothing,nothing
    else
        l_itr = zeros(itr_max,1);
        while itr < itr_max
            w = A * v;
            v = w / norm(w);
            l = reshape(v' * A * v,1)[1];
            itr += 1;
            l_itr[itr] = l;
            if (abs(l-l_old) < tol) && (norm(v-v_old)<tol) # If max_itr has been reached or if both eigenvector and eigenvalue are  within
                 l_itr = l_itr[1:itr];
                return v,l
            end
            v_old = v;
            l_old = l;
        end
        println("Did not converge within ",itr_max," iterations.")
        return nothing,nothing
    end
end
