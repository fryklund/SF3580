include("arnoldi.jl")

for k = 1:5
    a = [5,10,20,50,100]
    m = a[k]
    println("timings")
    ires = testArnoldi(m)
    println("Result")
    println(ires)
end
