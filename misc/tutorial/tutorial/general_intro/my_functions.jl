function squared_comp(x,y)
    return x^2,y^2
end

function log_sum(x,y,z)
    return log10(x+y+z)
end

function matrix_sum(C::Matrix)
    m,n=size(C)
    sumC=0
    for i=1:m
        for j=1:n
            sumC=sumC+C[i,j]
        end
    end
    return sumC
end
