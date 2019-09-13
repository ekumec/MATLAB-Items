function y = QPSKModulator(bitmat)
magnitude = 1 ;
dataseq = zeros(1,length(bitmat)/2) ;
    for i=1:2:length(bitmat)
            
        if( (bitmat(1,i) == 0) && (bitmat(1,i+1) == 0) )
            dataseq(1,(i+1)/2) = magnitude*exp(1j*pi/4) ;
        end
        if( (bitmat(1,i) == 1) && (bitmat(1,i+1) == 0)  )
            dataseq(1,(i+1)/2) = magnitude*exp(1j*3*pi/4) ;
        end
        if( (bitmat(1,i) == 1) && (bitmat(1,i+1) == 1)  )
            dataseq(1,(i+1)/2) = magnitude*exp(1j*5*pi/4) ;
        end
        if( (bitmat(1,i) == 0) && (bitmat(1,i+1) == 1)  )
            dataseq(1,(i+1)/2) = magnitude*exp(1j*7*pi/4) ;
        end

    end
y = dataseq ; 
end