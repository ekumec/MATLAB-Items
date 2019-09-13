function y = OddEvenDecomposer(mat)
    posin = linspace(1,length(mat),length(mat)) ;
    posin = posin-1 ;
    posin = de2bi(posin) ;
    posin = flip(posin,2) ;
    posin = bi2de(posin) ;
    posin = posin + 1 ;
    posin = posin' ;
    decom = zeros(1,length(mat)) ;
    for i = 1:length(mat)
        decom(1,i) = mat(1,posin(1,i)) ;
    end
    y = decom ;
end