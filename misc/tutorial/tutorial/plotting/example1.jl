# plotting a function
using PyCall, PyPlot

x=0:0.01:π
y=sin.(x)+exp.(-x).*x
plot(x,y)

# a more elaborated plot (on the same figure)
x2=0:0.01:2*π
y2=sin.(x2)+exp.(-x2).*(x2.^2)
plot(x2,y2,color="black",linestyle="--");

# a new plot in a new figure
figure()
x3=1:0.01:π
y3=log.(x3)+abs.(x3)
plot(x2,y2,color="red",linestyle="-");
