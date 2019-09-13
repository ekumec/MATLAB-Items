function y = RemoveGuardPilot(mat,guardpilotloc)  
    out = mat.*guardpilotloc ;
    tempmat = [] ;
    
    for i = 1:length(mat)
        if(out(1,i) ~= 0)
            tempmat = [tempmat , mat(1,i)] ;
        end
    end
    
    y = tempmat ;
    
end