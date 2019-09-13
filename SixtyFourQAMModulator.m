function y = SixtyFourQAMModulator(bitmat)
    datamat = zeros(1,length(bitmat)/6) ;
    for i = 1:6:length(bitmat)
        if((bitmat(1,i) == 0) && (bitmat(1,i+1) == 0) && (bitmat(1,i+2) == 0) && (bitmat(1,i+3) == 1) && (bitmat(1,i+4) == 0) && (bitmat(1,i+5) == 0) )
           datamat(1,(i+5)/6) = -7+7j ; 
        end
        if((bitmat(1,i) == 0) && (bitmat(1,i+1) == 0) && (bitmat(1,i+2) == 1) && (bitmat(1,i+3) == 1) && (bitmat(1,i+4) == 0) && (bitmat(1,i+5) == 0) )
           datamat(1,(i+5)/6) = -5+7j ; 
        end
        if((bitmat(1,i) == 0) && (bitmat(1,i+1) == 1) && (bitmat(1,i+2) == 1) && (bitmat(1,i+3) == 1) && (bitmat(1,i+4) == 0) && (bitmat(1,i+5) == 0) )
           datamat(1,(i+5)/6) = -3+7j ; 
        end
        if((bitmat(1,i) == 0) && (bitmat(1,i+1) == 1) && (bitmat(1,i+2) == 0) && (bitmat(1,i+3) == 1) && (bitmat(1,i+4) == 0) && (bitmat(1,i+5) == 0) )
           datamat(1,(i+5)/6) = -1+7j ; 
        end
        if((bitmat(1,i) == 1) && (bitmat(1,i+1) == 1) && (bitmat(1,i+2) == 0) && (bitmat(1,i+3) == 1) && (bitmat(1,i+4) == 0) && (bitmat(1,i+5) == 0) )
           datamat(1,(i+5)/6) = +1+7j ; 
        end
        if((bitmat(1,i) == 1) && (bitmat(1,i+1) == 1) && (bitmat(1,i+2) == 1) && (bitmat(1,i+3) == 1) && (bitmat(1,i+4) == 0) && (bitmat(1,i+5) == 0) )
           datamat(1,(i+5)/6) = +3+7j ; 
        end
         if((bitmat(1,i) == 1) && (bitmat(1,i+1) == 0) && (bitmat(1,i+2) == 1) && (bitmat(1,i+3) == 1) && (bitmat(1,i+4) == 0) && (bitmat(1,i+5) == 0) )
           datamat(1,(i+5)/6) = +5+7j ; 
         end
         if((bitmat(1,i) == 1) && (bitmat(1,i+1) == 0) && (bitmat(1,i+2) == 0) && (bitmat(1,i+3) == 1) && (bitmat(1,i+4) == 0) && (bitmat(1,i+5) == 0) )
           datamat(1,(i+5)/6) = +7+7j ; 
         end
        if((bitmat(1,i) == 0) && (bitmat(1,i+1) == 0) && (bitmat(1,i+2) == 0) && (bitmat(1,i+3) == 1) && (bitmat(1,i+4) == 0) && (bitmat(1,i+5) == 1) )
           datamat(1,(i+5)/6) = -7+5j ; 
        end
         if((bitmat(1,i) == 0) && (bitmat(1,i+1) == 0) && (bitmat(1,i+2) == 1) && (bitmat(1,i+3) == 1) && (bitmat(1,i+4) == 0) && (bitmat(1,i+5) == 1) )
           datamat(1,(i+5)/6) = -5+5j ; 
         end
         if((bitmat(1,i) == 0) && (bitmat(1,i+1) == 1) && (bitmat(1,i+2) == 1) && (bitmat(1,i+3) == 1) && (bitmat(1,i+4) == 0) && (bitmat(1,i+5) == 1) )
           datamat(1,(i+5)/6) = -3+5j ; 
         end
          if((bitmat(1,i) == 0) && (bitmat(1,i+1) == 1) && (bitmat(1,i+2) == 0) && (bitmat(1,i+3) == 1) && (bitmat(1,i+4) == 0) && (bitmat(1,i+5) == 1) )
           datamat(1,(i+5)/6) = -1+5j ; 
          end
         if((bitmat(1,i) == 1) && (bitmat(1,i+1) == 1) && (bitmat(1,i+2) == 0) && (bitmat(1,i+3) == 1) && (bitmat(1,i+4) == 0) && (bitmat(1,i+5) == 1) )
           datamat(1,(i+5)/6) = +1+5j ; 
         end
          if((bitmat(1,i) == 1) && (bitmat(1,i+1) == 1) && (bitmat(1,i+2) == 1) && (bitmat(1,i+3) == 1) && (bitmat(1,i+4) == 0) && (bitmat(1,i+5) == 1) )
           datamat(1,(i+5)/6) = +3+5j ; 
          end
          if((bitmat(1,i) == 1) && (bitmat(1,i+1) == 0) && (bitmat(1,i+2) == 1) && (bitmat(1,i+3) == 1) && (bitmat(1,i+4) == 0) && (bitmat(1,i+5) == 1) )
           datamat(1,(i+5)/6) = +5+5j ; 
          end
          if((bitmat(1,i) == 1) && (bitmat(1,i+1) == 0) && (bitmat(1,i+2) == 0) && (bitmat(1,i+3) == 1) && (bitmat(1,i+4) == 0) && (bitmat(1,i+5) == 1) )
           datamat(1,(i+5)/6) = +7+5j ; 
          end
          if((bitmat(1,i) == 0) && (bitmat(1,i+1) == 0) && (bitmat(1,i+2) == 0) && (bitmat(1,i+3) == 1) && (bitmat(1,i+4) == 1) && (bitmat(1,i+5) == 1) )
           datamat(1,(i+5)/6) = -7+3j ; 
          end
          if((bitmat(1,i) == 0) && (bitmat(1,i+1) == 0) && (bitmat(1,i+2) == 1) && (bitmat(1,i+3) == 1) && (bitmat(1,i+4) == 1) && (bitmat(1,i+5) == 1) )
           datamat(1,(i+5)/6) = -5+3j ; 
          end
          if((bitmat(1,i) == 0) && (bitmat(1,i+1) == 1) && (bitmat(1,i+2) == 1) && (bitmat(1,i+3) == 1) && (bitmat(1,i+4) == 1) && (bitmat(1,i+5) == 1) )
           datamat(1,(i+5)/6) = -3+3j ; 
          end
          if((bitmat(1,i) == 0) && (bitmat(1,i+1) == 1) && (bitmat(1,i+2) == 0) && (bitmat(1,i+3) == 1) && (bitmat(1,i+4) == 1) && (bitmat(1,i+5) == 1) )
           datamat(1,(i+5)/6) = -1+3j ; 
          end
          if((bitmat(1,i) == 1) && (bitmat(1,i+1) == 1) && (bitmat(1,i+2) == 0) && (bitmat(1,i+3) == 1) && (bitmat(1,i+4) == 1) && (bitmat(1,i+5) == 1) )
           datamat(1,(i+5)/6) = +1+3j ; 
          end
          if((bitmat(1,i) == 1) && (bitmat(1,i+1) == 1) && (bitmat(1,i+2) == 1) && (bitmat(1,i+3) == 1) && (bitmat(1,i+4) == 1) && (bitmat(1,i+5) == 1) )
           datamat(1,(i+5)/6) = +3+3j ; 
          end
          if((bitmat(1,i) == 1) && (bitmat(1,i+1) == 0) && (bitmat(1,i+2) == 1) && (bitmat(1,i+3) == 1) && (bitmat(1,i+4) == 1) && (bitmat(1,i+5) == 1) )
           datamat(1,(i+5)/6) = +5+3j ; 
          end
          if((bitmat(1,i) == 1) && (bitmat(1,i+1) == 0) && (bitmat(1,i+2) == 0) && (bitmat(1,i+3) == 1) && (bitmat(1,i+4) == 1) && (bitmat(1,i+5) == 1) )
           datamat(1,(i+5)/6) = +7+3j ; 
          end
          if((bitmat(1,i) == 0) && (bitmat(1,i+1) == 0) && (bitmat(1,i+2) == 0) && (bitmat(1,i+3) == 1) && (bitmat(1,i+4) == 1) && (bitmat(1,i+5) == 0) )
           datamat(1,(i+5)/6) = -7+1j ; 
          end
          if((bitmat(1,i) == 0) && (bitmat(1,i+1) == 0) && (bitmat(1,i+2) == 1) && (bitmat(1,i+3) == 1) && (bitmat(1,i+4) == 1) && (bitmat(1,i+5) == 0) )
           datamat(1,(i+5)/6) = -5+1j ; 
          end
          if((bitmat(1,i) == 0) && (bitmat(1,i+1) == 1) && (bitmat(1,i+2) == 1) && (bitmat(1,i+3) == 1) && (bitmat(1,i+4) == 1) && (bitmat(1,i+5) == 0) )
           datamat(1,(i+5)/6) = -3+1j ; 
          end
          if((bitmat(1,i) == 0) && (bitmat(1,i+1) == 1) && (bitmat(1,i+2) == 0) && (bitmat(1,i+3) == 1) && (bitmat(1,i+4) == 1) && (bitmat(1,i+5) == 0) )
           datamat(1,(i+5)/6) = -1+1j ; 
          end
          if((bitmat(1,i) == 1) && (bitmat(1,i+1) == 1) && (bitmat(1,i+2) == 0) && (bitmat(1,i+3) == 1) && (bitmat(1,i+4) == 1) && (bitmat(1,i+5) == 0) )
           datamat(1,(i+5)/6) = +1+1j ; 
          end
          if((bitmat(1,i) == 1) && (bitmat(1,i+1) == 1) && (bitmat(1,i+2) == 1) && (bitmat(1,i+3) == 1) && (bitmat(1,i+4) == 1) && (bitmat(1,i+5) == 0) )
           datamat(1,(i+5)/6) = +3+1j ; 
          end
          if((bitmat(1,i) == 1) && (bitmat(1,i+1) == 0) && (bitmat(1,i+2) == 1) && (bitmat(1,i+3) == 1) && (bitmat(1,i+4) == 1) && (bitmat(1,i+5) == 0) )
           datamat(1,(i+5)/6) = +5+1j ; 
          end
          if((bitmat(1,i) == 1) && (bitmat(1,i+1) == 0) && (bitmat(1,i+2) == 0) && (bitmat(1,i+3) == 1) && (bitmat(1,i+4) == 1) && (bitmat(1,i+5) == 0) )
           datamat(1,(i+5)/6) = +7+1j ; 
          end
          if((bitmat(1,i) == 1) && (bitmat(1,i+1) == 0) && (bitmat(1,i+2) == 0) && (bitmat(1,i+3) == 1) && (bitmat(1,i+4) == 1) && (bitmat(1,i+5) == 0) )
           datamat(1,(i+5)/6) = +7+1j ; 
          end
          if((bitmat(1,i) == 0) && (bitmat(1,i+1) == 0) && (bitmat(1,i+2) == 0) && (bitmat(1,i+3) == 0) && (bitmat(1,i+4) == 1) && (bitmat(1,i+5) == 0) )
           datamat(1,(i+5)/6) = -7-1j ; 
          end
          if((bitmat(1,i) == 0) && (bitmat(1,i+1) == 0) && (bitmat(1,i+2) == 1) && (bitmat(1,i+3) == 0) && (bitmat(1,i+4) == 1) && (bitmat(1,i+5) == 0) )
           datamat(1,(i+5)/6) = -5-1j ; 
          end
          if((bitmat(1,i) == 0) && (bitmat(1,i+1) == 1) && (bitmat(1,i+2) == 1) && (bitmat(1,i+3) == 0) && (bitmat(1,i+4) == 1) && (bitmat(1,i+5) == 0) )
           datamat(1,(i+5)/6) = -3-1j ; 
          end
          if((bitmat(1,i) == 0) && (bitmat(1,i+1) == 1) && (bitmat(1,i+2) == 0) && (bitmat(1,i+3) == 0) && (bitmat(1,i+4) == 1) && (bitmat(1,i+5) == 0) )
           datamat(1,(i+5)/6) = -1-1j ; 
          end
          if((bitmat(1,i) == 1) && (bitmat(1,i+1) == 1) && (bitmat(1,i+2) == 0) && (bitmat(1,i+3) == 0) && (bitmat(1,i+4) == 1) && (bitmat(1,i+5) == 0) )
           datamat(1,(i+5)/6) = +1-1j ; 
          end
          if((bitmat(1,i) == 1) && (bitmat(1,i+1) == 1) && (bitmat(1,i+2) == 1) && (bitmat(1,i+3) == 0) && (bitmat(1,i+4) == 1) && (bitmat(1,i+5) == 0) )
           datamat(1,(i+5)/6) = +3-1j ; 
          end
          if((bitmat(1,i) == 1) && (bitmat(1,i+1) == 0) && (bitmat(1,i+2) == 1) && (bitmat(1,i+3) == 0) && (bitmat(1,i+4) == 1) && (bitmat(1,i+5) == 0) )
           datamat(1,(i+5)/6) = +5-1j ; 
          end
          if((bitmat(1,i) == 1) && (bitmat(1,i+1) == 0) && (bitmat(1,i+2) == 0) && (bitmat(1,i+3) == 0) && (bitmat(1,i+4) == 1) && (bitmat(1,i+5) == 0) )
           datamat(1,(i+5)/6) = +7-1j ; 
          end
          if((bitmat(1,i) == 0) && (bitmat(1,i+1) == 0) && (bitmat(1,i+2) == 0) && (bitmat(1,i+3) == 0) && (bitmat(1,i+4) == 1) && (bitmat(1,i+5) == 1) )
           datamat(1,(i+5)/6) = -7-3j ; 
          end
          if((bitmat(1,i) == 0) && (bitmat(1,i+1) == 0) && (bitmat(1,i+2) == 1) && (bitmat(1,i+3) == 0) && (bitmat(1,i+4) == 1) && (bitmat(1,i+5) == 1) )
           datamat(1,(i+5)/6) = -5-3j ; 
          end
          if((bitmat(1,i) == 0) && (bitmat(1,i+1) == 1) && (bitmat(1,i+2) == 1) && (bitmat(1,i+3) == 0) && (bitmat(1,i+4) == 1) && (bitmat(1,i+5) == 1) )
           datamat(1,(i+5)/6) = -3-3j ; 
          end
          if((bitmat(1,i) == 0) && (bitmat(1,i+1) == 1) && (bitmat(1,i+2) == 0) && (bitmat(1,i+3) == 0) && (bitmat(1,i+4) == 1) && (bitmat(1,i+5) == 1) )
           datamat(1,(i+5)/6) = -1-3j ; 
          end
          if((bitmat(1,i) == 1) && (bitmat(1,i+1) == 1) && (bitmat(1,i+2) == 0) && (bitmat(1,i+3) == 0) && (bitmat(1,i+4) == 1) && (bitmat(1,i+5) == 1) )
           datamat(1,(i+5)/6) = +1-3j ; 
          end
          if((bitmat(1,i) == 1) && (bitmat(1,i+1) == 1) && (bitmat(1,i+2) == 1) && (bitmat(1,i+3) == 0) && (bitmat(1,i+4) == 1) && (bitmat(1,i+5) == 1) )
           datamat(1,(i+5)/6) = +3-3j ; 
          end
          if((bitmat(1,i) == 1) && (bitmat(1,i+1) == 0) && (bitmat(1,i+2) == 1) && (bitmat(1,i+3) == 0) && (bitmat(1,i+4) == 1) && (bitmat(1,i+5) == 1) )
           datamat(1,(i+5)/6) = +5-3j ; 
          end
          if((bitmat(1,i) == 1) && (bitmat(1,i+1) == 0) && (bitmat(1,i+2) == 0) && (bitmat(1,i+3) == 0) && (bitmat(1,i+4) == 1) && (bitmat(1,i+5) == 1) )
           datamat(1,(i+5)/6) = +7-3j ; 
          end
          if((bitmat(1,i) == 0) && (bitmat(1,i+1) == 0) && (bitmat(1,i+2) == 0) && (bitmat(1,i+3) == 0) && (bitmat(1,i+4) == 0) && (bitmat(1,i+5) == 1) )
           datamat(1,(i+5)/6) = -7-5j ; 
          end
          if((bitmat(1,i) == 0) && (bitmat(1,i+1) == 0) && (bitmat(1,i+2) == 1) && (bitmat(1,i+3) == 0) && (bitmat(1,i+4) == 0) && (bitmat(1,i+5) == 1) )
           datamat(1,(i+5)/6) = -5-5j ; 
          end
          if((bitmat(1,i) == 0) && (bitmat(1,i+1) == 1) && (bitmat(1,i+2) == 1) && (bitmat(1,i+3) == 0) && (bitmat(1,i+4) == 0) && (bitmat(1,i+5) == 1) )
           datamat(1,(i+5)/6) = -3-5j ; 
          end
          if((bitmat(1,i) == 0) && (bitmat(1,i+1) == 1) && (bitmat(1,i+2) == 0) && (bitmat(1,i+3) == 0) && (bitmat(1,i+4) == 0) && (bitmat(1,i+5) == 1) )
           datamat(1,(i+5)/6) = -1-5j ; 
          end
          if((bitmat(1,i) == 1) && (bitmat(1,i+1) == 1) && (bitmat(1,i+2) == 0) && (bitmat(1,i+3) == 0) && (bitmat(1,i+4) == 0) && (bitmat(1,i+5) == 1) )
           datamat(1,(i+5)/6) = +1-5j ; 
          end
          if((bitmat(1,i) == 1) && (bitmat(1,i+1) == 1) && (bitmat(1,i+2) == 1) && (bitmat(1,i+3) == 0) && (bitmat(1,i+4) == 0) && (bitmat(1,i+5) == 1) )
           datamat(1,(i+5)/6) = +3-5j ; 
          end
          if((bitmat(1,i) == 1) && (bitmat(1,i+1) == 0) && (bitmat(1,i+2) == 1) && (bitmat(1,i+3) == 0) && (bitmat(1,i+4) == 0) && (bitmat(1,i+5) == 1) )
           datamat(1,(i+5)/6) = +5-5j ; 
          end
          if((bitmat(1,i) == 1) && (bitmat(1,i+1) == 0) && (bitmat(1,i+2) == 0) && (bitmat(1,i+3) == 0) && (bitmat(1,i+4) == 0) && (bitmat(1,i+5) == 1) )
           datamat(1,(i+5)/6) = +7-5j ; 
          end
          if((bitmat(1,i) == 0) && (bitmat(1,i+1) == 0) && (bitmat(1,i+2) == 0) && (bitmat(1,i+3) == 0) && (bitmat(1,i+4) == 0) && (bitmat(1,i+5) == 0) )
           datamat(1,(i+5)/6) = -7-7j ; 
          end
          if((bitmat(1,i) == 0) && (bitmat(1,i+1) == 0) && (bitmat(1,i+2) == 1) && (bitmat(1,i+3) == 0) && (bitmat(1,i+4) == 0) && (bitmat(1,i+5) == 0) )
           datamat(1,(i+5)/6) = -5-7j ; 
          end
          if((bitmat(1,i) == 0) && (bitmat(1,i+1) == 1) && (bitmat(1,i+2) == 1) && (bitmat(1,i+3) == 0) && (bitmat(1,i+4) == 0) && (bitmat(1,i+5) == 0) )
           datamat(1,(i+5)/6) = -3-7j ; 
          end
          if((bitmat(1,i) == 0) && (bitmat(1,i+1) == 1) && (bitmat(1,i+2) == 0) && (bitmat(1,i+3) == 0) && (bitmat(1,i+4) == 0) && (bitmat(1,i+5) == 0) )
           datamat(1,(i+5)/6) = -1-7j ; 
          end
          if((bitmat(1,i) == 1) && (bitmat(1,i+1) == 1) && (bitmat(1,i+2) == 0) && (bitmat(1,i+3) == 0) && (bitmat(1,i+4) == 0) && (bitmat(1,i+5) == 0) )
           datamat(1,(i+5)/6) = +1-7j ; 
          end
          if((bitmat(1,i) == 1) && (bitmat(1,i+1) == 1) && (bitmat(1,i+2) == 1) && (bitmat(1,i+3) == 0) && (bitmat(1,i+4) == 0) && (bitmat(1,i+5) == 0) )
           datamat(1,(i+5)/6) = +3-7j ; 
          end
          if((bitmat(1,i) == 1) && (bitmat(1,i+1) == 0) && (bitmat(1,i+2) == 1) && (bitmat(1,i+3) == 0) && (bitmat(1,i+4) == 0) && (bitmat(1,i+5) == 0) )
           datamat(1,(i+5)/6) = +5-7j ; 
          end
          if((bitmat(1,i) == 1) && (bitmat(1,i+1) == 0) && (bitmat(1,i+2) == 0) && (bitmat(1,i+3) == 0) && (bitmat(1,i+4) == 0) && (bitmat(1,i+5) == 0) )
           datamat(1,(i+5)/6) = +7-7j ; 
          end
    end
    datamat = datamat/sqrt(2)/4 ;
    y = datamat ;
end