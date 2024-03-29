function y = EightPointIFFT(mat)
    twid1 = 1/(sqrt(2)) + 1j/(sqrt(2)) ;
    twid2 = twid1*twid1 ;
    twid3 = twid1*twid1*twid1 ;
    out1 = zeros(1,8) ;
    out2 = zeros(1,8) ;
    out3 = zeros(1,8) ;
    out1(1,1) = mat(1,1) + mat(1,5) ;
    out1(1,2) = mat(1,2) + mat(1,6) ;
    out1(1,3) = mat(1,3) + mat(1,7) ;
    out1(1,4) = mat(1,4) + mat(1,8) ;
    out1(1,5) = mat(1,1) - mat(1,5) ;
    out1(1,6) = twid1*(mat(1,2) - mat(1,6)) ;
    out1(1,7) = twid2*(mat(1,3) - mat(1,7)) ;
    out1(1,8) = twid3*(mat(1,4) - mat(1,8)) ;
    out2(1,1) = out1(1,1) + out1(1,3) ;
    out2(1,2) = out1(1,2) + out1(1,4) ;
    out2(1,3) = out1(1,1) - out1(1,3) ;
    out2(1,4) = twid2*(out1(1,2) - out1(1,4)) ;
    out2(1,5) = out1(1,5) + out1(1,7) ;
    out2(1,6) = out1(1,6) + out1(1,8) ;
    out2(1,7) = out1(1,5) - out1(1,7) ;
    out2(1,8) = twid2*(out1(1,6) - out1(1,8)) ;
    out3(1,1) = out2(1,1) + out2(1,2) ;
    out3(1,2) = out2(1,1) - out2(1,2) ;
    out3(1,3) = out2(1,3) + out2(1,4) ;
    out3(1,4) = out2(1,3) - out2(1,4) ;
    out3(1,5) = out2(1,5) + out2(1,6) ;
    out3(1,6) = out2(1,5) - out2(1,6) ;
    out3(1,7) = out2(1,7) + out2(1,8) ;
    out3(1,8) = out2(1,7) - out2(1,8) ;
    out3 = out3 / 8 ;
    out3 = OddEvenDecomposer(out3) ;
    y = out3 ;
end