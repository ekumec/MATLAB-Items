function [y,guardpilotloc] = AddGuardPilot2(pilotloc,pilotmat,datastart,datamat)
    
    tempmat = zeros(1,64) ;
    tempmat(1,pilotloc(1,1)) = pilotmat(1,1) ;
    tempmat(1,pilotloc(1,2)) = pilotmat(1,2) ;
    tempmat(1,pilotloc(1,3)) = pilotmat(1,3) ;
    tempmat(1,pilotloc(1,4)) = pilotmat(1,4) ;
    k = datastart ;
    
    datai = 1 ;
    while(datai <= 48)
       if((k == pilotloc(1,1)) || (k == pilotloc(1,2)) || (k == pilotloc(1,3)) || (k == pilotloc(1,4)) || (k == 32))
           k = k+1 ; 
       end
       tempmat(1,k) = datamat(1,datai) ;
       k = k+1 ;
       datai = datai+1 ;
    end
    guardpilotloc = ones(1,64) ;
    for k = 1:64
        if((k ~= 32)&&(tempmat(1,k) == 0))
            guardpilotloc(1,k) = 0 ;
        end
        if( (k ~= 32) &&( (k == pilotloc(1,1)) || (k == pilotloc(1,2)) || (k == pilotloc(1,3)) || (k == pilotloc(1,4))))
            guardpilotloc(1,k) = 0 ;
        end
        if(k == 32)
            guardpilotloc(1,k) = 0 ;
        end
    end
    
    y = tempmat;
    
end