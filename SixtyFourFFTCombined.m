function y = SixtyFourFFTCombined(mat)
    
    seq1 = zeros(1,8) ;
    seq2 = zeros(1,8) ;
    seq3 = zeros(1,8) ;
    seq4 = zeros(1,8) ;
    seq5 = zeros(1,8) ;
    seq6 = zeros(1,8) ;
    seq7 = zeros(1,8) ;
    seq8 = zeros(1,8) ;
    
    twid16 = 0.9239 - 0.3827i ;
    twid32 = 0.9808 - 0.1951i ;
    twid64 = 0.7071 - 0.7071i ;
    
    out = zeros(1,64);
    
    for i = 1:8:length(mat)
        seq1(1,(i+7)/8) = mat(1,i) ;   
    end
    for i = 5:8:length(mat)
        seq2(1,(i+3)/8) = mat(1,i) ;
    end
    for i = 3:8:length(mat)
        seq3(1,(i+5)/8) = mat(1,i) ;
    end
    for i = 7:8:length(mat)
        seq4(1,(i+1)/8) = mat(1,i) ;
    end
    for i = 2:8:length(mat)
        seq5(1,(i+6)/8) = mat(1,i) ;
    end
    for i = 6:8:length(mat)
        seq6(1,(i+2)/8) = mat(1,i) ;
    end
    for i = 4:8:length(mat)
        seq7(1,(i+4)/8) = mat(1,i) ;
    end
    for i = 8:8:length(mat)
        seq8(1,i/8) = mat(1,i) ;
    end
    
    seq1 = EightPointFFT(seq1) ;
    seq2 = EightPointFFT(seq2) ;
    seq3 = EightPointFFT(seq3) ;
    seq4 = EightPointFFT(seq4) ;
    seq5 = EightPointFFT(seq5) ;
    seq6 = EightPointFFT(seq6) ;
    seq7 = EightPointFFT(seq7) ;
    seq8 = EightPointFFT(seq8) ;
    
    for m = 1:8
        out(1,m) = seq1(1,m) + (twid16^m)*(seq2(1,m)) + (twid32^m)*(seq3(1,m)) + (twid16^m)*(twid32^m)*(seq4(1,m)) + (twid64^m)*(seq5(1,m)) + (twid64^m)*(twid16^m)*(seq6(1,m)) + (twid64^m)*(twid32^m)*(seq7(1,m)) + (twid64^m)*(twid32^m)*(twid16^m)*(seq8(1,m));
    end
    
    for m = 9:16
        out(1,m) = seq1(1,m-8) + (twid16^m)*(seq2(1,m-8)) + (twid32^m)*(seq3(1,m-8)) + (twid16^m)*(twid32^m)*(seq4(1,m-8)) + (twid64^m)*(seq5(1,m-8)) + (twid64^m)*(twid16^m)*(seq6(1,m-8)) + (twid64^m)*(twid32^m)*(seq7(1,m-8)) + (twid64^m)*(twid32^m)*(twid16^m)*(seq8(1,m-8)) ;
    end
    
    for m = 17:24
        out(1,m) = seq1(1,m-16) + (twid16^m)*(seq2(1,m-16)) + (twid32^m)*(seq3(1,m-16)) + (twid16^m)*(twid32^m)*(seq4(1,m-16)) + (twid64^m)*(seq5(1,m-16)) + (twid64^m)*(twid16^m)*(seq6(1,m-16)) + (twid64^m)*(twid32^m)*(seq7(1,m-16)) + (twid64^m)*(twid32^m)*(twid16^m)*(seq8(1,m-16)) ;
    end
    
    for m = 25:32
        out(1,m) = seq1(1,m-24) + (twid16^m)*(seq2(1,m-24)) + (twid32^m)*(seq3(1,m-24)) + (twid16^m)*(twid32^m)*(seq4(1,m-24)) + (twid64^m)*(seq5(1,m-24)) + (twid64^m)*(twid16^m)*(seq6(1,m-24)) + (twid64^m)*(twid32^m)*(seq7(1,m-24)) + (twid64^m)*(twid32^m)*(twid16^m)*(seq8(1,m-24)) ;
    end
    
    for m = 33:40
        out(1,m) = seq1(1,m-32) + (twid16^m)*(seq2(1,m-32)) + (twid32^m)*(seq3(1,m-32)) + (twid16^m)*(twid32^m)*(seq4(1,m-32)) + (twid64^m)*(seq5(1,m-32)) + (twid64^m)*(twid16^m)*(seq6(1,m-32)) + (twid64^m)*(twid32^m)*(seq7(1,m-32)) + (twid64^m)*(twid32^m)*(twid16^m)*(seq8(1,m-32)) ;
    end
    
    for m = 41:48
         out(1,m) = seq1(1,m-40) + (twid16^m)*(seq2(1,m-40)) + (twid32^m)*(seq3(1,m-40)) + (twid16^m)*(twid32^m)*(seq4(1,m-40)) + (twid64^m)*(seq5(1,m-40)) + (twid64^m)*(twid16^m)*(seq6(1,m-40)) + (twid64^m)*(twid32^m)*(seq7(1,m-40)) + (twid64^m)*(twid32^m)*(twid16^m)*(seq8(1,m-40)) ;
    end
    
    for m = 49:56
        out(1,m) = seq1(1,m-48) + (twid16^m)*(seq2(1,m-48)) + (twid32^m)*(seq3(1,m-48)) + (twid16^m)*(twid32^m)*(seq4(1,m-48)) + (twid64^m)*(seq5(1,m-48)) + (twid64^m)*(twid16^m)*(seq6(1,m-48)) + (twid64^m)*(twid32^m)*(seq7(1,m-48)) + (twid64^m)*(twid32^m)*(twid16^m)*(seq8(1,m-48)) ;
    end
    
    for m = 57:64
        out(1,m) = seq1(1,m-56) + (twid16^m)*(seq2(1,m-56)) + (twid32^m)*(seq3(1,m-56)) + (twid16^m)*(twid32^m)*(seq4(1,m-56)) + (twid64^m)*(seq5(1,m-56)) + (twid64^m)*(twid16^m)*(seq6(1,m-56)) + (twid64^m)*(twid32^m)*(seq7(1,m-56)) + (twid64^m)*(twid32^m)*(twid16^m)*(seq8(1,m-56)) ;
    end
    y = out ;
end