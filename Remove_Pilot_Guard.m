function y = Remove_Pilot_Guard(mat)
    datamat = zeros(1,48) ;
    datamat(1,1:5) = mat(1,7:11) ;
    datamat(1,6:18) = mat(1,13:25) ;
    datamat(1,19:25) = mat(1,26:32);
    datamat(1,26:31) = mat(1,34:39) ;
    datamat(1,32:44) = mat(1,41:53) ;
    datamat(1,45:49 ) = mat(1,55:59) ;
    datamat = [datamat(1,1:18) , datamat(1,20:49) ];
    y = datamat ;
end