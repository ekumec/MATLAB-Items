function y = ThirtyTwoPointtoSixtyFourPointIFFT(mat)
    twid = exp(1j*2*pi/64) ;
    out = zeros(1,64) ;
    seq1 = zeros(1,32) ;
    seq2 = zeros(1,32) ;
    
    for k = 1:32
        seq1(1,k) = mat(1,2*k-1) ;
    end
    
    seq1 = SixteenPointtoThirtyTwoPointIFFT(seq1) ;
    seq1 = [seq1,seq1] ;
    
    for k = 1:32
        seq2(1,k) = mat(1,2*k) ;     
    end
    
    seq2 = SixteenPointtoThirtyTwoPointIFFT(seq2) ;
    seq2 = [seq2,seq2] ;
    
    for k = 1:64
        out(1,k) = (seq1(1,k)) + (twid^(k-1))*(seq2(1,k)) ;
    end
    y = out/2 ;
end