function rayleigh_quotient(A,x,mu,tol,allData = false)
n = size(A,1);
Id = Matrix{Float64}(I,n,n);
itr::Int8 = 1;
itr_max::Int8 = 100;
v = x / norm(x);
l = Array{Float64}(undef, itr_max);
l[1] = mu;


while itr < itr_max
    v_old = v;
    B = (A - l[itr] * Id);
    if cond(B,2) > 1e12
        println("Matrix singular after ",itr-1," iterations.")
        l = l[1:itr];
        return v,l
    end
    w = B \ v;
    v = w / norm(w);
    itr += 1;
    l[itr] = v' * A * v;
    if abs(l[itr]-l[itr-1]) < tol && (norm(v-v_old)<tol||norm(v+v_old)<tol) # If max_itr has been reached or if both eigenvector and eigenvalue are  within tolerance
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
