function y = EuclidDist(x1,x2)
    a = x1(1,1) ;
    b = x1(1,2) ;
    c = x2(1,1) ;
    d = x2(1,2) ;
    
    y = sqrt((a-c)^2 + (b-d)^2) ;
    
end