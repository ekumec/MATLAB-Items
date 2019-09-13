function y = TwoPointIFFT(mat)
    out = zeros(1,2) ;
    out(1,1) = 1/2*(mat(1,1)+ mat(1,2)) ;
    out(1,2) = 1/2*(mat(1,1) - mat(1,2)) ;
    y = out ;
end