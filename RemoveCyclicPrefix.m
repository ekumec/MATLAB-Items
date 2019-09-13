function y = RemoveCyclicPrefix(mat,prefixlen)
    tempmat = zeros(1,length(mat) - length(prefixlen)) ;
    tempmat = mat(1,prefixlen+1:length(mat)) ;
    y = tempmat ;
end