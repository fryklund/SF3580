function [A,b,XX,YY,h] = construct_poisson_matrices(f,g,m,alpha)
    %create grid
    h = 1/(m+1);
    x = h:h:1-h;
    y = h:h:1-h;
	[XX,YY] = meshgrid(x,y);
    X = XX(:);
    Y = YY(:);

    %create rhs
    b = f(X,Y);
    b = b(:);

    %Created large sparse matrix A representing the system
    e = ones(m,1);
    T = spdiags([e -4*e e], -1:1, m, m);
    e = ones(m^2,1);
    II = spdiags([e e],-m:2*m:m,m^2,m^2);
    %spy(II);

    C = spalloc(m^2,m^2,3*m^2);
    for i =1:m
        C(m*(i-1)+1:m*(i),m*(i-1)+1:m*(i)) =T;
    end
    %figure()
    %spy(C);
    A = (C+II)*(1/h^2);
    %spy(A)

    gg = g(x',y,alpha);
    G  = spdiags(gg(:),0,m^2,m^2); 
    A = A+G;
    %figure(4)
    %imagesc(A)

end