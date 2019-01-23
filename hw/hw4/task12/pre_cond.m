function res = pre_cond(b,m)
    h = 1/(m+1);
    e = ones(m,1);
    T = spdiags([e -2*e e], -1:1, m, m);
    res =  lyap(T,-reshape(b,m,m)*h^2);
    res = res(:);
end