function y = SixtyFourQAMDemodulator2(dataseq)
    bitmat = zeros(1,6*length(dataseq)) ;
    symloc = [-7 -7 ; -7 -5 ; -7 -1 ; -7 -3 ; -7 7 ; -7 5 ; -7 1 ; -7 3 ; -5 -7 ; -5 -5 ; -5 -1 ; -5 -3 ; -5 7 ; -5 5 ; -5 1 ; -5 3 ; -1 -7 ; -1 -5 ; -1 -1 ; -1 -3 ; -1 7 ; -1 5 ; -1 1 ; -1 3 ; -3 -7 ; -3 -5 ; -3 -1 ; -3 -3 ; -3 7 ; -3 5 ; -3 1 ; -3 3 ; 7 -7 ; 7 -5 ; 7 -1 ; 7 -3 ; 7 7 ; 7 5 ; 7 1 ; 7 3 ; 5 -7 ; 5 -5 ; 5 -1 ; 5 -3 ; 5 7 ; 5 5 ; 5 1 ; 5 3 ; 1 -7 ; 1 -5 ; 1 -1 ; 1 -3 ; 1 7 ; 1 5 ; 1 1 ; 1 3 ; 3 -7 ; 3 -5 ; 3 -1 ; 3 -3 ; 3 7 ; 3 5 ; 3 1 ; 3 3] ;
    symloc = symloc*sqrt(42) ;
    symmat = zeros(length(dataseq),1) ;
    for i=1:length(dataseq)
        distmatrix = zeros(1,64) ;
        for k = 1:64
            distmatrix(1,k) = EuclidDist(symloc(k,1:2),[real(dataseq(1,i)) , imag(dataseq(1,i))]) ;
        end
        [m,ind] = min(distmatrix) ;
        symmat(i,1) = ind ;
        display = ['Distance: ',num2str(m) ,' ' ,'Symbol index: ' , num2str(ind) ] ; %for testing purposes
    end
    symmat = symmat' ;
    
    for i=1:length(symmat)
        if(symmat(1,i) == 1)
            bitmat(1,i*6-5) = 0 ; bitmat(1,6*i-4) = 0 ; bitmat(1,6*i-3) = 0 ; bitmat(1,6*i-2) = 0 ; bitmat(1,i*6-1) = 0 ; bitmat(1,i*6) = 0 ;
        end
        if(symmat(1,i) == 2)
            bitmat(1,i*6-5) = 0 ; bitmat(1,6*i-4) = 0 ; bitmat(1,6*i-3) = 0 ; bitmat(1,6*i-2) = 0 ; bitmat(1,i*6-1) = 0 ; bitmat(1,i*6) = 1 ;
        end
        if(symmat(1,i) == 3)
            bitmat(1,i*6-5) = 0 ; bitmat(1,6*i-4) = 0 ; bitmat(1,6*i-3) = 0 ; bitmat(1,6*i-2) = 0 ; bitmat(1,i*6-1) = 1 ; bitmat(1,i*6) = 0 ;
        end
        if(symmat(1,i) == 4)
            bitmat(1,i*6-5) = 0 ; bitmat(1,6*i-4) = 0 ; bitmat(1,6*i-3) = 0 ; bitmat(1,6*i-2) = 0 ; bitmat(1,i*6-1) = 1 ; bitmat(1,i*6) = 1 ;
        end
        if(symmat(1,i) == 5)
            bitmat(1,i*6-5) = 0 ; bitmat(1,6*i-4) = 0 ; bitmat(1,6*i-3) = 0 ; bitmat(1,6*i-2) = 1 ; bitmat(1,i*6-1) = 0 ; bitmat(1,i*6) = 0 ;
        end
        if(symmat(1,i) == 6)
            bitmat(1,i*6-5) = 0 ; bitmat(1,6*i-4) = 0 ; bitmat(1,6*i-3) = 0 ; bitmat(1,6*i-2) = 1 ; bitmat(1,i*6-1) = 0 ; bitmat(1,i*6) = 1 ;
        end
        if(symmat(1,i) == 7)
            bitmat(1,i*6-5) = 0 ; bitmat(1,6*i-4) = 0 ; bitmat(1,6*i-3) = 0 ; bitmat(1,6*i-2) = 1 ; bitmat(1,i*6-1) = 1 ; bitmat(1,i*6) = 0 ;
        end
        if(symmat(1,i) == 8)
            bitmat(1,i*6-5) = 0 ; bitmat(1,6*i-4) = 0 ; bitmat(1,6*i-3) = 0 ; bitmat(1,6*i-2) = 1 ; bitmat(1,i*6-1) = 1 ; bitmat(1,i*6) = 1 ;
        end
        if(symmat(1,i) == 9)
            bitmat(1,i*6-5) = 0 ; bitmat(1,6*i-4) = 0 ; bitmat(1,6*i-3) = 1 ; bitmat(1,6*i-2) = 0 ; bitmat(1,i*6-1) = 0 ; bitmat(1,i*6) = 0 ;
        end
        if(symmat(1,i) == 10)
            bitmat(1,i*6-5) = 0 ; bitmat(1,6*i-4) = 0 ; bitmat(1,6*i-3) = 1 ; bitmat(1,6*i-2) = 0 ; bitmat(1,i*6-1) = 0 ; bitmat(1,i*6) = 1 ;
        end
        if(symmat(1,i) == 11)
            bitmat(1,i*6-5) = 0 ; bitmat(1,6*i-4) = 0 ; bitmat(1,6*i-3) = 1 ; bitmat(1,6*i-2) = 0 ; bitmat(1,i*6-1) = 1 ; bitmat(1,i*6) = 0 ;
        end
        if(symmat(1,i) == 12)
            bitmat(1,i*6-5) = 0 ; bitmat(1,6*i-4) = 0 ; bitmat(1,6*i-3) = 1 ; bitmat(1,6*i-2) = 0 ; bitmat(1,i*6-1) = 1 ; bitmat(1,i*6) = 1 ;
        end
        if(symmat(1,i) == 13)
            bitmat(1,i*6-5) = 0 ; bitmat(1,6*i-4) = 0 ; bitmat(1,6*i-3) = 1 ; bitmat(1,6*i-2) = 1 ; bitmat(1,i*6-1) = 0 ; bitmat(1,i*6) = 0 ;
        end
        if(symmat(1,i) == 14)
            bitmat(1,i*6-5) = 0 ; bitmat(1,6*i-4) = 0 ; bitmat(1,6*i-3) = 1 ; bitmat(1,6*i-2) = 1 ; bitmat(1,i*6-1) = 0 ; bitmat(1,i*6) = 1 ;
        end
        if(symmat(1,i) == 15)
            bitmat(1,i*6-5) = 0 ; bitmat(1,6*i-4) = 0 ; bitmat(1,6*i-3) = 1 ; bitmat(1,6*i-2) = 1 ; bitmat(1,i*6-1) = 1 ; bitmat(1,i*6) = 0 ;
        end
        if(symmat(1,i) == 16)
            bitmat(1,i*6-5) = 0 ; bitmat(1,6*i-4) = 0 ; bitmat(1,6*i-3) = 1 ; bitmat(1,6*i-2) = 1 ; bitmat(1,i*6-1) = 1 ; bitmat(1,i*6) = 1 ;
        end
        if(symmat(1,i) == 17)
            bitmat(1,i*6-5) = 0 ; bitmat(1,6*i-4) = 1 ; bitmat(1,6*i-3) = 0 ; bitmat(1,6*i-2) = 0 ; bitmat(1,i*6-1) = 0 ; bitmat(1,i*6) = 0 ;
        end
        if(symmat(1,i) == 18)
            bitmat(1,i*6-5) = 0 ; bitmat(1,6*i-4) = 1 ; bitmat(1,6*i-3) = 0 ; bitmat(1,6*i-2) = 0 ; bitmat(1,i*6-1) = 0 ; bitmat(1,i*6) = 1 ;
        end
        if(symmat(1,i) == 19)
            bitmat(1,i*6-5) = 0 ; bitmat(1,6*i-4) = 1 ; bitmat(1,6*i-3) = 0 ; bitmat(1,6*i-2) = 0 ; bitmat(1,i*6-1) = 1 ; bitmat(1,i*6) = 0 ;
        end
        if(symmat(1,i) == 20)
            bitmat(1,i*6-5) = 0 ; bitmat(1,6*i-4) = 1 ; bitmat(1,6*i-3) = 0 ; bitmat(1,6*i-2) = 0 ; bitmat(1,i*6-1) = 1 ; bitmat(1,i*6) = 1 ;
        end
        if(symmat(1,i) == 21)
            bitmat(1,i*6-5) = 0 ; bitmat(1,6*i-4) = 1 ; bitmat(1,6*i-3) = 0 ; bitmat(1,6*i-2) = 1 ; bitmat(1,i*6-1) = 0 ; bitmat(1,i*6) = 0 ;
        end
        if(symmat(1,i) == 22)
            bitmat(1,i*6-5) = 0 ; bitmat(1,6*i-4) = 1 ; bitmat(1,6*i-3) = 0 ; bitmat(1,6*i-2) = 1 ; bitmat(1,i*6-1) = 0 ; bitmat(1,i*6) = 1 ;
        end
        if(symmat(1,i) == 23)
            bitmat(1,i*6-5) = 0 ; bitmat(1,6*i-4) = 1 ; bitmat(1,6*i-3) = 0 ; bitmat(1,6*i-2) = 1 ; bitmat(1,i*6-1) = 1 ; bitmat(1,i*6) = 0 ;
        end
        if(symmat(1,i) == 24)
            bitmat(1,i*6-5) = 0 ; bitmat(1,6*i-4) = 1 ; bitmat(1,6*i-3) = 0 ; bitmat(1,6*i-2) = 1 ; bitmat(1,i*6-1) = 1 ; bitmat(1,i*6) = 1 ;
        end
        if(symmat(1,i) == 25)
            bitmat(1,i*6-5) = 0 ; bitmat(1,6*i-4) = 1 ; bitmat(1,6*i-3) = 1 ; bitmat(1,6*i-2) = 0 ; bitmat(1,i*6-1) = 0 ; bitmat(1,i*6) = 0 ;
        end
        if(symmat(1,i) == 26)
            bitmat(1,i*6-5) = 0 ; bitmat(1,6*i-4) = 1 ; bitmat(1,6*i-3) = 1 ; bitmat(1,6*i-2) = 0 ; bitmat(1,i*6-1) = 0 ; bitmat(1,i*6) = 1 ;
        end
        if(symmat(1,i) == 27)
            bitmat(1,i*6-5) = 0 ; bitmat(1,6*i-4) = 1 ; bitmat(1,6*i-3) = 1 ; bitmat(1,6*i-2) = 0 ; bitmat(1,i*6-1) = 1 ; bitmat(1,i*6) = 0 ;
        end
        if(symmat(1,i) == 28)
            bitmat(1,i*6-5) = 0 ; bitmat(1,6*i-4) = 1 ; bitmat(1,6*i-3) = 1 ; bitmat(1,6*i-2) = 0 ; bitmat(1,i*6-1) = 1 ; bitmat(1,i*6) = 1 ;
        end
        if(symmat(1,i) == 29)
            bitmat(1,i*6-5) = 0 ; bitmat(1,6*i-4) = 1 ; bitmat(1,6*i-3) = 1 ; bitmat(1,6*i-2) = 1 ; bitmat(1,i*6-1) = 0 ; bitmat(1,i*6) = 0 ;
        end
        if(symmat(1,i) == 30)
            bitmat(1,i*6-5) = 0 ; bitmat(1,6*i-4) = 1 ; bitmat(1,6*i-3) = 1 ; bitmat(1,6*i-2) = 1 ; bitmat(1,i*6-1) = 0 ; bitmat(1,i*6) = 1 ;
        end
        if(symmat(1,i) == 31)
            bitmat(1,i*6-5) = 0 ; bitmat(1,6*i-4) = 1 ; bitmat(1,6*i-3) = 1 ; bitmat(1,6*i-2) = 1 ; bitmat(1,i*6-1) = 1 ; bitmat(1,i*6) = 0 ;
        end
        if(symmat(1,i) == 32)
            bitmat(1,i*6-5) = 0 ; bitmat(1,6*i-4) = 1 ; bitmat(1,6*i-3) = 1 ; bitmat(1,6*i-2) = 1 ; bitmat(1,i*6-1) = 1 ; bitmat(1,i*6) = 1 ;
        end
        if(symmat(1,i) == 33)
            bitmat(1,i*6-5) = 1 ; bitmat(1,6*i-4) = 0 ; bitmat(1,6*i-3) = 0 ; bitmat(1,6*i-2) = 0 ; bitmat(1,i*6-1) = 0 ; bitmat(1,i*6) = 0 ;
        end
        if(symmat(1,i) == 34)
            bitmat(1,i*6-5) = 1 ; bitmat(1,6*i-4) = 0 ; bitmat(1,6*i-3) = 0 ; bitmat(1,6*i-2) = 0 ; bitmat(1,i*6-1) = 0 ; bitmat(1,i*6) = 1 ;
        end
        if(symmat(1,i) == 35)
            bitmat(1,i*6-5) = 1 ; bitmat(1,6*i-4) = 0 ; bitmat(1,6*i-3) = 0 ; bitmat(1,6*i-2) = 0 ; bitmat(1,i*6-1) = 1 ; bitmat(1,i*6) = 0 ;
        end
        if(symmat(1,i) == 36)
            bitmat(1,i*6-5) = 1 ; bitmat(1,6*i-4) = 0 ; bitmat(1,6*i-3) = 0 ; bitmat(1,6*i-2) = 0 ; bitmat(1,i*6-1) = 1 ; bitmat(1,i*6) = 1 ;
        end
        if(symmat(1,i) == 37)
            bitmat(1,i*6-5) = 1 ; bitmat(1,6*i-4) = 0 ; bitmat(1,6*i-3) = 0 ; bitmat(1,6*i-2) = 1 ; bitmat(1,i*6-1) = 0 ; bitmat(1,i*6) = 0 ;
        end
        if(symmat(1,i) == 38)
            bitmat(1,i*6-5) = 1 ; bitmat(1,6*i-4) = 0 ; bitmat(1,6*i-3) = 0 ; bitmat(1,6*i-2) = 1 ; bitmat(1,i*6-1) = 0 ; bitmat(1,i*6) = 1 ;
        end
        if(symmat(1,i) == 39)
            bitmat(1,i*6-5) = 1 ; bitmat(1,6*i-4) = 0 ; bitmat(1,6*i-3) = 0 ; bitmat(1,6*i-2) = 1 ; bitmat(1,i*6-1) = 1 ; bitmat(1,i*6) = 0 ;
        end
        if(symmat(1,i) == 40)
            bitmat(1,i*6-5) = 1 ; bitmat(1,6*i-4) = 0 ; bitmat(1,6*i-3) = 0 ; bitmat(1,6*i-2) = 1 ; bitmat(1,i*6-1) = 1 ; bitmat(1,i*6) = 1 ;
        end
        if(symmat(1,i) == 41)
            bitmat(1,i*6-5) = 1 ; bitmat(1,6*i-4) = 0 ; bitmat(1,6*i-3) = 1 ; bitmat(1,6*i-2) = 0 ; bitmat(1,i*6-1) = 0 ; bitmat(1,i*6) = 0 ;
        end
        if(symmat(1,i) == 42)
            bitmat(1,i*6-5) = 1 ; bitmat(1,6*i-4) = 0 ; bitmat(1,6*i-3) = 1 ; bitmat(1,6*i-2) = 0 ; bitmat(1,i*6-1) = 0 ; bitmat(1,i*6) = 1 ;
        end
        if(symmat(1,i) == 43)
            bitmat(1,i*6-5) = 1 ; bitmat(1,6*i-4) = 0 ; bitmat(1,6*i-3) = 1 ; bitmat(1,6*i-2) = 0 ; bitmat(1,i*6-1) = 1 ; bitmat(1,i*6) = 0 ;
        end
        if(symmat(1,i) == 44)
            bitmat(1,i*6-5) = 1 ; bitmat(1,6*i-4) = 0 ; bitmat(1,6*i-3) = 1 ; bitmat(1,6*i-2) = 0 ; bitmat(1,i*6-1) = 1 ; bitmat(1,i*6) = 1 ;
        end
        if(symmat(1,i) == 45)
            bitmat(1,i*6-5) = 1 ; bitmat(1,6*i-4) = 0 ; bitmat(1,6*i-3) = 1 ; bitmat(1,6*i-2) = 1 ; bitmat(1,i*6-1) = 0 ; bitmat(1,i*6) = 0 ;
        end
        if(symmat(1,i) == 46)
            bitmat(1,i*6-5) = 1 ; bitmat(1,6*i-4) = 0 ; bitmat(1,6*i-3) = 1 ; bitmat(1,6*i-2) = 1 ; bitmat(1,i*6-1) = 0 ; bitmat(1,i*6) = 1 ;
        end
        if(symmat(1,i) == 47)
            bitmat(1,i*6-5) = 1 ; bitmat(1,6*i-4) = 0 ; bitmat(1,6*i-3) = 1 ; bitmat(1,6*i-2) = 1 ; bitmat(1,i*6-1) = 1 ; bitmat(1,i*6) = 0 ;
        end
        if(symmat(1,i) == 48)
            bitmat(1,i*6-5) = 1 ; bitmat(1,6*i-4) = 0 ; bitmat(1,6*i-3) = 1 ; bitmat(1,6*i-2) = 1 ; bitmat(1,i*6-1) = 1 ; bitmat(1,i*6) = 1 ;
        end
        if(symmat(1,i) == 49)
            bitmat(1,i*6-5) = 1 ; bitmat(1,6*i-4) = 1 ; bitmat(1,6*i-3) = 0 ; bitmat(1,6*i-2) = 0 ; bitmat(1,i*6-1) = 0 ; bitmat(1,i*6) = 0 ;
        end
        if(symmat(1,i) == 50)
            bitmat(1,i*6-5) = 1 ; bitmat(1,6*i-4) = 1 ; bitmat(1,6*i-3) = 0 ; bitmat(1,6*i-2) = 0 ; bitmat(1,i*6-1) = 0 ; bitmat(1,i*6) = 1 ;
        end
        if(symmat(1,i) == 51)
            bitmat(1,i*6-5) = 1 ; bitmat(1,6*i-4) = 1 ; bitmat(1,6*i-3) = 0 ; bitmat(1,6*i-2) = 0 ; bitmat(1,i*6-1) = 1 ; bitmat(1,i*6) = 0 ;
        end
        if(symmat(1,i) == 52)
            bitmat(1,i*6-5) = 1 ; bitmat(1,6*i-4) = 1 ; bitmat(1,6*i-3) = 0 ; bitmat(1,6*i-2) = 0 ; bitmat(1,i*6-1) = 1 ; bitmat(1,i*6) = 1 ;
        end
        if(symmat(1,i) == 53)
            bitmat(1,i*6-5) = 1 ; bitmat(1,6*i-4) = 1 ; bitmat(1,6*i-3) = 0 ; bitmat(1,6*i-2) = 1 ; bitmat(1,i*6-1) = 0 ; bitmat(1,i*6) = 0 ;
        end
        if(symmat(1,i) == 54)
            bitmat(1,i*6-5) = 1 ; bitmat(1,6*i-4) = 1 ; bitmat(1,6*i-3) = 0 ; bitmat(1,6*i-2) = 1 ; bitmat(1,i*6-1) = 0 ; bitmat(1,i*6) = 1 ;
        end
        if(symmat(1,i) == 55)
            bitmat(1,i*6-5) = 1 ; bitmat(1,6*i-4) = 1 ; bitmat(1,6*i-3) = 0 ; bitmat(1,6*i-2) = 1 ; bitmat(1,i*6-1) = 1 ; bitmat(1,i*6) = 0 ;
        end
        if(symmat(1,i) == 56)
            bitmat(1,i*6-5) = 1 ; bitmat(1,6*i-4) = 1 ; bitmat(1,6*i-3) = 0 ; bitmat(1,6*i-2) = 1 ; bitmat(1,i*6-1) = 1 ; bitmat(1,i*6) = 1 ;
        end
        if(symmat(1,i) == 57)
            bitmat(1,i*6-5) = 1 ; bitmat(1,6*i-4) = 1 ; bitmat(1,6*i-3) = 1 ; bitmat(1,6*i-2) = 0 ; bitmat(1,i*6-1) = 0 ; bitmat(1,i*6) = 0 ;
        end
        if(symmat(1,i) == 58)
            bitmat(1,i*6-5) = 1 ; bitmat(1,6*i-4) = 1 ; bitmat(1,6*i-3) = 1 ; bitmat(1,6*i-2) = 0 ; bitmat(1,i*6-1) = 0 ; bitmat(1,i*6) = 1 ;
        end
        if(symmat(1,i) == 59)
            bitmat(1,i*6-5) = 1 ; bitmat(1,6*i-4) = 1 ; bitmat(1,6*i-3) = 1 ; bitmat(1,6*i-2) = 0 ; bitmat(1,i*6-1) = 1 ; bitmat(1,i*6) = 0 ;
        end
        if(symmat(1,i) == 60)
            bitmat(1,i*6-5) = 1 ; bitmat(1,6*i-4) = 1 ; bitmat(1,6*i-3) = 1 ; bitmat(1,6*i-2) = 0 ; bitmat(1,i*6-1) = 1 ; bitmat(1,i*6) = 1 ;
        end
        if(symmat(1,i) == 61)
            bitmat(1,i*6-5) = 1 ; bitmat(1,6*i-4) = 1 ; bitmat(1,6*i-3) = 1 ; bitmat(1,6*i-2) = 1 ; bitmat(1,i*6-1) = 0 ; bitmat(1,i*6) = 0 ;
        end
        if(symmat(1,i) == 62)
            bitmat(1,i*6-5) = 1 ; bitmat(1,6*i-4) = 1 ; bitmat(1,6*i-3) = 1 ; bitmat(1,6*i-2) = 1 ; bitmat(1,i*6-1) = 0 ; bitmat(1,i*6) = 1 ;
        end
        if(symmat(1,i) == 63)
            bitmat(1,i*6-5) = 1 ; bitmat(1,6*i-4) = 1 ; bitmat(1,6*i-3) = 1 ; bitmat(1,6*i-2) = 1 ; bitmat(1,i*6-1) = 1 ; bitmat(1,i*6) = 0 ;
        end
        if(symmat(1,i) == 64)
            bitmat(1,i*6-5) = 1 ; bitmat(1,6*i-4) = 1 ; bitmat(1,6*i-3) = 1 ; bitmat(1,6*i-2) = 1 ; bitmat(1,i*6-1) = 1 ; bitmat(1,i*6) = 1 ;
        end
    end
    y = bitmat ;
    
end