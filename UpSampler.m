function y = UpSampler(mat,uprate)
    tempmat = zeros(1,length(mat)*uprate) ;
    k = 1;
    for ind = 1:uprate:length(tempmat)
        tempmat(1,ind) = mat(1,k) ;
        k = k+1 ;
    end
    y = tempmat ;
    
end