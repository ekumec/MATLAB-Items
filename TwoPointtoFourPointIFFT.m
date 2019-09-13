function y = TwoPointtoFourPointIFFT(mat)
    twid = 1j ;
    out = zeros(1,4) ;
    seq1 = zeros(1,2) ;
    seq2 = zeros(1,2) ;
    mat = mat*2 ;
    for k = 1:2
        seq1(1,k) = mat(1,2*k-1) ;
    end
    
    seq1 = TwoPointIFFT(seq1) ;
    seq1 = [seq1,seq1] ;
    
    for k = 1:2
        seq2(1,k) = mat(1,2*k) ;     
    end
    
    seq2 = TwoPointIFFT(seq2) ;
    seq2 = [seq2,seq2] ;
    
    for k = 1:4
        out(1,k) = (seq1(1,k)) + (twid^(k-1))*(seq2(1,k)) ;
    end
    y = out/4 ;
end