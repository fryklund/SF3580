function F=schur_parlett(A,f)
% The Schur-Parlett method. The function handle f is a scalar
% valued function
    [Q,T]=schur(A,'complex');  % complex schur form since to make
                               % it work for complex complex eigenvalues
    n=length(A);
    for i=1:n
        F(i,i)=f(T(i,i));
    end
    for p=1:n-1
        ???
    end

    F=Q*F*Q';
