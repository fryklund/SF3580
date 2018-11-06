#todo: Which norm to use? Don't think it matters.

function power_iteration(A,x,tol,allData = false)
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
    itr = 1; # Iteration counter

    l = Array{Float64}(undef, itr_max);
    l[1] = 1;
        while itr < itr_max
            v_old = v; # save previous value
            itr += 1;
            w = A * v;
            v = w / norm(w);
            l[itr] = v' * A * v; # Wan to work around this.
            if (abs(l[itr]-l[itr-1]) < tol) && (norm(v-v_old)<tol) # If max_itr has been reached or if both eigenvector and eigenvalue are  within tolerance
                if allData
                    l = l[1:itr];
                else
                    l = l[itr];
                end
                println("Converge in ",itr-1," iterations.")
                return v,l
            end

        end
        println("Did not converge within ",itr_max," iterations.")
        return nothing,nothing
end
