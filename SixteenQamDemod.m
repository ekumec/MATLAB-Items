function y = SixteenQamDemod(dataseq)
    bitmat = zeros(1,4*length(dataseq)) ;
    symloc = [[-3 3] ; [-3 1] ; [-3 -3] ; [-3 -1] ; [-1 3] ; [-1 1] ; [-1 -3] ; [-1 -1] ; [3 3] ; [3 1] ; [3 -3] ; [3 -1] ; [1 3] ; [1 1] ; [1 -3] ; [1 -1]] ;
    symloc = symloc*4*sqrt(2) ;
    symmat = zeros(length(dataseq),1) ;
    for i=1:length(dataseq)
        distmatrix = zeros(1,16) ;
        for k = 1:16
            distmatrix(1,k) = EuclidDist(symloc(k,1:2),[real(dataseq(1,i)) , imag(dataseq(1,i))]) ;
        end
        [m,ind] = min(distmatrix) ;
        symmat(i,1) = ind ;
    end
    symmat = symmat' ;
    
    for i=1:length(symmat)
        if(symmat(1,i) == 1)
            bitmat(1,i*4-3) = 0 ; bitmat(1,4*i-2) = 0 ; bitmat(1,4*i-1) = 0 ; bitmat(1,4*i) = 0 ;
        end
        if(symmat(1,i) == 2)
            bitmat(1,i*4-3) = 0 ; bitmat(1,4*i-2) = 0 ; bitmat(1,4*i-1) = 0 ; bitmat(1,4*i) = 1 ;
        end
        if(symmat(1,i) == 3)
            bitmat(1,i*4-3) = 0 ; bitmat(1,4*i-2) = 0 ; bitmat(1,4*i-1) = 1 ; bitmat(1,4*i) = 0 ;
        end
        if(symmat(1,i) == 4)
            bitmat(1,i*4-3) = 0 ; bitmat(1,4*i-2) = 0 ; bitmat(1,4*i-1) = 1 ; bitmat(1,4*i) = 1 ;
        end
         if(symmat(1,i) == 5)
            bitmat(1,i*4-3) = 0 ; bitmat(1,4*i-2) = 1 ; bitmat(1,4*i-1) = 0 ; bitmat(1,4*i) = 0 ;
        end
        if(symmat(1,i) == 6)
            bitmat(1,i*4-3) = 0 ; bitmat(1,4*i-2) = 1 ; bitmat(1,4*i-1) = 0 ; bitmat(1,4*i) = 1 ;
        end
        if(symmat(1,i) == 7)
            bitmat(1,i*4-3) = 0 ; bitmat(1,4*i-2) = 1 ; bitmat(1,4*i-1) = 1 ; bitmat(1,4*i) = 0 ;
        end
        if(symmat(1,i) == 8)
            bitmat(1,i*4-3) = 0 ; bitmat(1,4*i-2) = 1 ; bitmat(1,4*i-1) = 1 ; bitmat(1,4*i) = 1 ;
        end
        if(symmat(1,i) == 9)
            bitmat(1,i*4-3) = 1 ; bitmat(1,4*i-2) = 0 ; bitmat(1,4*i-1) = 0 ; bitmat(1,4*i) = 0 ;
        end
        if(symmat(1,i) == 10)
            bitmat(1,i*4-3) = 1 ; bitmat(1,4*i-2) = 0 ; bitmat(1,4*i-1) = 0 ; bitmat(1,4*i) = 1 ;
        end
        if(symmat(1,i) == 11)
            bitmat(1,i*4-3) = 1 ; bitmat(1,4*i-2) = 0 ; bitmat(1,4*i-1) = 1 ; bitmat(1,4*i) = 0 ;
        end
        if(symmat(1,i) == 12)
            bitmat(1,i*4-3) = 1 ; bitmat(1,4*i-2) = 0 ; bitmat(1,4*i-1) = 1 ; bitmat(1,4*i) = 1 ;
        end
         if(symmat(1,i) == 13)
            bitmat(1,i*4-3) = 1 ; bitmat(1,4*i-2) = 1 ; bitmat(1,4*i-1) = 0 ; bitmat(1,4*i) = 0 ;
        end
        if(symmat(1,i) == 14)
            bitmat(1,i*4-3) = 1 ; bitmat(1,4*i-2) = 1 ; bitmat(1,4*i-1) = 0 ; bitmat(1,4*i) = 1 ;
        end
        if(symmat(1,i) == 15)
            bitmat(1,i*4-3) = 1 ; bitmat(1,4*i-2) = 1 ; bitmat(1,4*i-1) = 1 ; bitmat(1,4*i) = 0 ;
        end
        if(symmat(1,i) == 16)
            bitmat(1,i*4-3) = 1 ; bitmat(1,4*i-2) = 1 ; bitmat(1,4*i-1) = 1 ; bitmat(1,4*i) = 1 ;
        end
    end
    y = bitmat ;
end