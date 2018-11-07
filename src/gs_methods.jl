using LinearAlgebra

function doubleGS(Q,w,k)
    h = Q'*w
    #println(w)
    z = w-Q*h
    g = Q'*z
    z = z-Q*g
    h = h+g
    beta = norm(z)
    worth = z
    return h, beta,worth
end


function tripleGS(Q,w,k)
    h = Q'*w
    #println(w)
    z = w-Q*h
    g = Q'*z
    z = z-Q*g

    k = Q'*z
    z = z-Q*k

    h = h+g+k
    beta = norm(z)
    worth = z
    return h, beta,worth
end


function modifiedGS(Q,w,k)
    z = w
    h = zeros(1,k)
    for i = 1:k
        println(Q);
        h[i] = Q[:,i]'*z
        z = z-h[i]*Q[:,i]
    end
    beta = norm(z)
    worth = z
    return h, beta,worth
end

function singleGS(Q,w,k)
    h = Q'*w
    #println(w)
    z = w-Q*h
    beta = norm(z)
    worth = z
    return h, beta,worth
end
