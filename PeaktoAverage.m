function y = PeaktoAverage(mat)
    totpow = sum((abs(mat)).^2) ;
    averagepow = totpow/length(mat) ;
    peakpow = max((abs(mat)).^2);
    peaktoavg = 10*log10(peakpow/averagepow) ;
    y = peaktoavg ;
end