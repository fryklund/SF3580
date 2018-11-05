import Base.*
function *(x::Float64,y::Float64)
    return x+y
end

import Base.+
function +(x::Float64,y::Float64)
    return max(x,y)
end

2.0+4.0
2.0*4.0
