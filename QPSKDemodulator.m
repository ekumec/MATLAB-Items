function y = QPSKDemodulator(mat)
    bitsequence = zeros(1,length(mat)*2) ; 
    for i = 1:length(mat)
        if((real(mat(1,i)) >= 0) && (imag(mat(1,i)) > 0) )
            bitsequence(1,i*2-1) = 0 ; bitsequence(1,2*i) = 0 ; %exp(1j*pi/4)
        end
        if((real(mat(1,i)) < 0) && (imag(mat(1,i)) >= 0) )
            bitsequence(1,i*2-1) = 1 ; bitsequence(1,i*2) = 0 ; %exp(1j*3*pi/4)
        end
        if((real(mat(1,i)) <= 0) && (imag(mat(1,i)) < 0) )
            bitsequence(1,i*2-1) = 1 ; bitsequence(1,i*2) = 1 ; %exp(1j*5*pi/4)
        end
        if((real(mat(1,i)) > 0) && (imag(mat(1,i)) <= 0) )
            bitsequence(1,i*2-1) = 0 ; bitsequence(1,i*2) = 1 ; %exp(1j*7*pi/4)
        end
        if((real(mat(1,i)) == 0) && (imag(mat(1,i)) == 0))
            bitsequence(1,i*2-1) = 0 ; bitsequence(1,2*i) = 0 ;
        end
    end
   y = bitsequence ;
end