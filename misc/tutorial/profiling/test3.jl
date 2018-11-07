using BenchmarkTools, Random, LinearAlgebra

n=1000
A=rand(n,n)
b=rand(n)


function my_profile()
    @btime begin 
        C=A*transpose(A)
        x=C\b
        z=x+b;
    end     
    
    @btime begin 
        x=A\b
        x=transpose(A)\x
        z=x+b;
    end 
        
end

my_profile()
1