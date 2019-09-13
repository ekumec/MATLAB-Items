function y = DownSampler(mat,downrate)
    tempmat = [] ;
    start = 1 ;
    for i=1:(downrate):length(mat)
        tempmat(1,start) = mat(1,i) ;
        start = start+1;
    end
    y = tempmat ;
end