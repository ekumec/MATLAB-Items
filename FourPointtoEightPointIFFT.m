function y = FourPointtoEightPointIFFT(mat)
    twid = sqrt(1j) ;
    out = zeros(1,8) ;
    seq1 = zeros(1,4) ;
    seq2 = zeros(1,4) ;
    
    for k = 1:4
        seq1(1,k) = mat(1,2*k-1) ;
    end
    
    seq1 = TwoPointtoFourPointIFFT(seq1) ;
    seq1 = [seq1,seq1] ;
    
    for k = 1:4
        seq2(1,k) = mat(1,2*k) ;     
    end
    
    seq2 = TwoPointtoFourPointIFFT(seq2) ;
    seq2 = [seq2,seq2] ;
    
    for k = 1:8
        out(1,k) = (seq1(1,k)) + (twid^(k-1))*(seq2(1,k)) ;
    end
    y = out/2 ;
end