
function naive_power(A,N)
B = A
for i = 1:N-1
  B = B * A
end
return B
end
