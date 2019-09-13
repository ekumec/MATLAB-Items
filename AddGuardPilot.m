function [y,guardint] = AddGuardPilot(datamat,pilotmat,pilotloc,datastart)
   tempmat = zeros(1,65) ;
   tempmat(1,pilotloc(1,1)) = pilotmat(1,1) ;
   tempmat(1,pilotloc(1,2)) = pilotmat(1,2) ;
   tempmat(1,pilotloc(1,3)) = pilotmat(1,3) ;
   tempmat(1,pilotloc(1,4)) = pilotmat(1,4) ;
   k = datastart ;
   datai = 1 ;
   while(datai <= 48)
       if((k == pilotloc(1,1)) || (k == pilotloc(1,2)) || (k == pilotloc(1,3)) || (k == pilotloc(1,4)) || (k == 33))
           k = k+1 ;
       end
       tempmat(1,k) = datamat(1,datai) ;
       k = k+1 ;
       datai = datai+1 ;
   end
   
   
   
   guardint(1,1) = 1 ;
   guardint(1,2) = datastart - 1 ;
   if((datastart > pilotloc(1,1)))
       guardint(1,2) = datastart - 1 - 1 ;
   end
   if((datastart > pilotloc(1,2)))
       guardint(1,2) = datastart - 1 - 1 - 1 ;
   end
   if((datastart > pilotloc(1,3)))
       guardint(1,2) = datastart - 1 - 1 - 1 - 1;
   end
   if((datastart > pilotloc(1,4)))
       guardint(1,2) = datastart - 1 - 1 - 1 - 1 - 1;
   end
   guardint(1,3) = k - 1 ;
   guardint(1,4) = length(tempmat) ;

   y = tempmat ;
end