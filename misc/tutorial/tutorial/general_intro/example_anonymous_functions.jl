# anonymous functions are defined as
f=x->sin(x)
g=λ->λ^2
# and we can evaluate as
z=3.4
y=f(z)
println("value for f(z)=",y)
# we can also compose them
h=x->f(g(x))
println("value for f∘g(z)=",f(g(z)) )

# anonymous functions can have more variables
r=(α,β,γ)->α^2+sin(β+γ)
println("value r(1,2,3)=",r(1,2,3))
