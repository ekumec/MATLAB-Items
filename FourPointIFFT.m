function y = FourPointIFFT(mat)
    out1 = zeros(1,4) ;
    out2 = zeros(1,4) ;
    twid1 = 1j ;
    out1(1,1) = mat(1,1) + mat(1,3) ;
    out1(1,2) = mat(1,2) + mat(1,4) ;
    out1(1,3) = mat(1,1) - mat(1,3) ;
    out1(1,4) = twid1*(mat(1,2) - mat(1,4)) ;
    out2(1,1) = out1(1,1) + out1(1,2) ;
    out2(1,2) = out1(1,1) - out1(1,2) ;
    out2(1,3) = out1(1,3) + out1(1,4) ;
    out2(1,4) = out1(1,3) - out1(1,4) ;
    out2 = out2 / 4 ;
    out2 = OddEvenDecomposer(out2) ;
    y = out2 ;
end