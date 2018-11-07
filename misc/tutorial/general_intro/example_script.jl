# comments what this script does
# define two numbers and sum them
a=2; b=π
c=a+b
# define two matrices and sum them
A=[ 1 2
    2 3]
B=[  2 -4
    -2  3 ]
C=A+B
# define a function that sum of the elements of a matrix
function sum_matrix_el(M)
    m,n=size(M) # get the size of the matrix
    sumM=0
    for i=1:n
        for j=1:m
            sumM=sumM+M[i,j]
        end
    end
    return sumM
end
println("The sum of the el. of C is ",sum_matrix_el(C))
