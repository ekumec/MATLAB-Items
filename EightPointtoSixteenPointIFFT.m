function y = EightPointtoSixteenPointIFFT(mat)
    twid = exp(1j*2*pi/16) ;
    out = zeros(1,16) ;
    seq1 = zeros(1,8) ;
    seq2 = zeros(1,8) ;
    
    for k = 1:8
        seq1(1,k) = mat(1,2*k-1) ;
    end
    
    seq1 = FourPointtoEightPointIFFT(seq1) ;
    seq1 = [seq1,seq1] ;
    
    for k = 1:8
        seq2(1,k) = mat(1,2*k) ;     
    end
    
    seq2 = FourPointtoEightPointIFFT(seq2) ;
    seq2 = [seq2,seq2] ;
    
    for k = 1:16
        out(1,k) = (seq1(1,k)) + (twid^(k-1))*(seq2(1,k)) ;
    end
    y = out/2 ;
end