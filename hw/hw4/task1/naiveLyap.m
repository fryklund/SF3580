function X = naiveLyap(A,P)
    P = -P;
    xvec = (kron(eye(size(A)),A)+kron(A,eye(size(A))))\P(:);
    X = reshape(xvec,size(A,1),size(A,2));
end