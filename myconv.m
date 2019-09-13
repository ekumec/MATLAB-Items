function y=myconv(a,b)
M = length(a) ;
N = length(b) ;
outputlength = M + N - 1 ;

a = [a, zeros(1,outputlength - M)] ;
b = [b, zeros(1,outputlength - N)] ;

x1 = fft(a, outputlength) ;
x2 = fft(b, outputlength) ;

z = x1.*x2 ;
y=ifft(z) ;

end