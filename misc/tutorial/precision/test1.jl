using PyPlot



function Newton_method(f::Function,fD::Function,x::Number)
    err_vec=zeros(100)
    for j=1:100
        x=x-f(x)/fD(x)
        err_vec[j]=abs(f(x))
    end
    return err_vec
end

f=x->x^2-2
fD=x->2*x

#err_vec=Newton_method(f,fD,1)
#setprecision(BigFloat, 500)
err_vec=Newton_method(f,fD,BigFloat(1))

semilogy(1:100,err_vec,linestyle="-");
