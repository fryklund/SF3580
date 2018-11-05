# define function
function my_prod(A,B)
    Z=A*B
    return Z
end
# evaluate this function
A=2.1; B=0.3
display(my_prod(A,B))
# we can evaluate this function also for matrices
Am=[1 2; 1 1]; Bm=[2 3; 0 9]
display(my_prod(Am,Bm))

# we can also force the input type of a function
function my_prod_num(A::Number,B::Number)
    Z=A*B
    return Z
end
display(my_prod_num(A,B))
display(my_prod_num(Am,Bm))
# read more about types
# https://docs.julialang.org/en/v1/manual/types/index.html
