function y = SixteenQAMModulator(bitmat)
dataseq = zeros(1,length(bitmat)/4) ;
    for i=1:4:length(bitmat)
            
        if( (bitmat(1,i) == 0) && (bitmat(1,i+1) == 0) && (bitmat(1,i+2) == 0) && (bitmat(1,i+3) == 0) )
            dataseq(1,(i+3)/4) = (-3+3j) ;
        end
        if( (bitmat(1,i) == 0) && (bitmat(1,i+1) == 0) && (bitmat(1,i+2) == 0) && (bitmat(1,i+3) == 1)  )
            dataseq(1,(i+3)/4) = (-3+1j) ;
        end
        if( (bitmat(1,i) == 0) && (bitmat(1,i+1) == 0) && (bitmat(1,i+2) == 1) && (bitmat(1,i+3) == 0)   )
            dataseq(1,(i+3)/4) = (-3-3j) ;
        end
        if( (bitmat(1,i) == 0) && (bitmat(1,i+1) == 0) && (bitmat(1,i+2) == 1) && (bitmat(1,i+3) == 1)   )
            dataseq(1,(i+3)/4) = (-3-1j) ;
        end
        if( (bitmat(1,i) == 0) && (bitmat(1,i+1) == 1) && (bitmat(1,i+2) == 0) && (bitmat(1,i+3) == 0) )
            dataseq(1,(i+3)/4) = (-1+3j) ;
        end
        if( (bitmat(1,i) == 0) && (bitmat(1,i+1) == 1) && (bitmat(1,i+2) == 0) && (bitmat(1,i+3) == 1)  )
            dataseq(1,(i+3)/4) = (-1+1j) ;
        end
        if( (bitmat(1,i) == 0) && (bitmat(1,i+1) == 1) && (bitmat(1,i+2) == 1) && (bitmat(1,i+3) == 0)   )
            dataseq(1,(i+3)/4) = (-1-3j) ;
        end
        if( (bitmat(1,i) == 0) && (bitmat(1,i+1) == 1) && (bitmat(1,i+2) == 1) && (bitmat(1,i+3) == 1)   )
            dataseq(1,(i+3)/4) = (-1-1j) ;
        end
        if( (bitmat(1,i) == 1) && (bitmat(1,i+1) == 0) && (bitmat(1,i+2) == 0) && (bitmat(1,i+3) == 0) )
            dataseq(1,(i+3)/4) = (3+3j) ;
        end
        if( (bitmat(1,i) == 1) && (bitmat(1,i+1) == 0) && (bitmat(1,i+2) == 0) && (bitmat(1,i+3) == 1)  )
            dataseq(1,(i+3)/4) = (3+1j);
        end
        if( (bitmat(1,i) == 1) && (bitmat(1,i+1) == 0) && (bitmat(1,i+2) == 1) && (bitmat(1,i+3) == 0)   )
            dataseq(1,(i+3)/4) = (3-3j) ;
        end
        if( (bitmat(1,i) == 1) && (bitmat(1,i+1) == 0) && (bitmat(1,i+2) == 1) && (bitmat(1,i+3) == 1)   )
            dataseq(1,(i+3)/4) = (3-1j) ;
        end
        if( (bitmat(1,i) == 1) && (bitmat(1,i+1) == 1) && (bitmat(1,i+2) == 0) && (bitmat(1,i+3) == 0) )
            dataseq(1,(i+3)/4) = (1+3j) ;
        end
        if( (bitmat(1,i) == 1) && (bitmat(1,i+1) == 1) && (bitmat(1,i+2) == 0) && (bitmat(1,i+3) == 1)  )
            dataseq(1,(i+3)/4) = (1+1j) ;
        end
        if( (bitmat(1,i) == 1) && (bitmat(1,i+1) == 1) && (bitmat(1,i+2) == 1) && (bitmat(1,i+3) == 0)   )
            dataseq(1,(i+3)/4) = (1-3j) ;
        end
        if( (bitmat(1,i) == 1) && (bitmat(1,i+1) == 1) && (bitmat(1,i+2) == 1) && (bitmat(1,i+3) == 1)   )
            dataseq(1,(i+3)/4) = (1-1j) ;
        end
    end
    dataseq = dataseq/4/sqrt(2);
    y = dataseq ;
end