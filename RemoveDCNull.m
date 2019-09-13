function y = RemoveDCNull(mat)
    tempmat = zeros(1,length(mat) - 1) ;
    mid = (length(mat)+1)/2 ;
    tempmat = [mat(1,1:mid-1) , mat(1,mid+1:length(mat)) ] ;
    y = tempmat ;
    
end