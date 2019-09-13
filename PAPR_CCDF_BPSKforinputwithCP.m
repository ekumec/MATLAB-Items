%PAPR_CCDF_BPSKforinputwithCP
clear all ; clc ; 
N = 2^16 ; databits = randi([0 1],1,N) ; moddata = BPSKModulator(databits) ;
IFFTi = [] ; IFFTotemp = [] ; IFFTo = [] ; prefixlen = 16; 
numofsamples = 10000 ; 

for k = 1:64:length(databits)

    IFFTi = moddata(1,k:k+63);
    IFFTotemp = ThirtyTwoPointtoSixtyFourPointIFFT(IFFTi) ;
    IFFTo = [IFFTo, IFFTotemp] ;

end

CPintemp = [] ; CPouttemp = [] ; CPout = [] ;

for k = 1:64:length(IFFTo)
    CPintemp = IFFTo(1,k:k+63) ;
    CPouttemp = AddCyclicPrefix(CPintemp,16) ;
    CPout = [CPout , CPouttemp ] ;
end

PAPRitemp = [] ; PAPRouttemp = [] ; PAPRo = [] ;

for k = 1:(64+prefixlen):length(CPout)

    PAPRitemp = CPout(1,k:k+64-1+prefixlen) ;
    PAPRotemp = PeaktoAverage(PAPRitemp) ;
    PAPRo = [PAPRo , PAPRotemp ] ;

end

cumulative = [] ;samplemax = max(PAPRo) ;samplemin = min(PAPRo) ;
paprvector = linspace(samplemin,samplemax,numofsamples) ; 

for k = 1:length(paprvector)
    cumulative(k) = length(find(PAPRo <= paprvector(k))) / (N/64) ; 
end

cumulative = ones(1,length(cumulative)) - cumulative ;
plot(paprvector,log10(cumulative),'r') ;
ylabel('Probabiliy that PAPR is larger than given value') ;
xlabel('PAPR value in dB') ;
title('CCDF comparison for different modulation schemes (Probability given in decades)') ;
hold on ;
alphaA = 4.8 ;
theoryccdf = 1-(1-exp(-paprvector)).^(alphaA*64);
plot(paprvector,log10(theoryccdf)) ;
hold on ;