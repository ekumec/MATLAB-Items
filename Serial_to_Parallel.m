function y = Serial_to_Parallel(mat)
sizei = size(mat) ;
if(sizei(1,2) > 1)
y = mat' ;
end
y = mat ;
end