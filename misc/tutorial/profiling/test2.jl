using BenchmarkTools, Random, LinearAlgebra

# sum all the elements of a function
function sum_mat(A)
    m,n=size(A)
    s=0
    for i=1:m 
        for j=1:n 
            s=s+A[i,j]
        end
    end
end

# sum all the elements of a function
# a better programming style
function sum_mat_2(A::Array{Float64,2})
    m,n=size(A)
    s::Float64=0
    @inbounds for i=1:m 
        @inbounds for j=1:n 
            s=s+A[i,j]
        end
    end
end

n=100
A=rand(n,n)

# it is usually better to profile inside a function
function compare_two_functions()
    @btime begin 
        s=sum_mat(A)
    end

    @btime begin 
        s=sum_mat_2(A)
    end
end 

# run the function
compare_two_functions()
