function y = SRRCFeyzi(rolloff,uprate,filtlength)
    
    while(mod(filtlength,2)==0)
        filtlength = input('Please enter an odd number for filter length') ;
    end
    
    while(rolloff > 1)
        rolloff = input('Please input a roll-off factor smaller than 1') ;
    end
    n = (-(filtlength-1)/2) ;
    outmat = [] ;
    for k = 1:filtlength
        if(n == 0)
           outmat(1,k) = (1/uprate)*(1-rolloff+4*rolloff/pi) ; 
        elseif((n == (uprate/4/rolloff))||(n == -(uprate/4/rolloff)))
           outmat(1,k) = (1/uprate)*(rolloff/sqrt(2))*((1+2/pi)*(sin(pi/4/rolloff))+(1-2/pi)*(cos(pi/4/rolloff)));
        else
           outmat(1,k) = (1/uprate)*((sin(pi*(1-rolloff)*n/uprate)+4*rolloff/uprate*n*cos(pi*(1+rolloff)*n/uprate))/(pi*n*(1-(4*rolloff*n/uprate)^2)/uprate)) ; 
        end
        
        n = n+1 ;
    end
    y = outmat ;
end