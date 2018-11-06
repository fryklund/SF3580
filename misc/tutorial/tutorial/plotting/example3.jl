# another way to plot (a different package)
# read more here https://github.com/JuliaPlots/Plots.jl
# close julia

using PyPlot
x=0:0.01:π
y=sin.(x)+exp.(-x).*x
plot(x,y)
