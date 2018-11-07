function f(x::Number)
    return -x
end

function f(X::Matrix)
    for i=1:size(X,1)
        X[i,1]=-X[i,1]
    end
    return X
end
x=-1
display(f(x))
X=[2 -1; -1 2];
display(f(X))
