%PAPR_CCDF_16QAMforinputwithCP
clear all ; clc ; 
Modorder = 16 ; m = log2(Modorder) ; FFTCount = 1500 ;
N = 48*m*FFTCount ; databits = randi([0 1],1,N) ; pilotbitlen = 4*FFTCount ;
pilotbits = randi([0 1],1,pilotbitlen) ; pilotloc = [11 25 39 53] ;
[bpskout,sixteenqamout] = SixteenQAMDataBPSKPilot(pilotbits,databits) ;
datastart = 6 ;
IFFTi = [] ; IFFTotemp = [] ; IFFTo = [] ; prefixlen = 16; 
PGintemp = [] ; PGouttemp = [] ; PGout = [] ; z = 1 ;
guardinttemp = [] ; guardint = [] ; pilottemp = [] ;

for k = 1:48:length(sixteenqamout)
    PGintemp = sixteenqamout(1,k:k+47) ;
    pilottemp = bpskout(1,z:z+3) ;
    [PGouttemp,guardinttemp] = AddGuardPilot(PGintemp,pilottemp,pilotloc,datastart) ;
    PGout = [PGout ,PGouttemp ] ;
    guardint = [guardint, guardinttemp ] ;
    z = z+4 ;
end


for k = 1:65:length(PGout)

    IFFTi = PGout(1,k:k+64);
    IFFTi = RemoveDCNull(IFFTi) ;
    IFFTotemp = ThirtyTwoPointtoSixtyFourPointIFFT(IFFTi) ;
    IFFTo = [IFFTo, IFFTotemp] ;

end

disp(length(IFFTo)) ;

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

cumulative = [] ;samplemin = min(PAPRo) ; samplemax = max(PAPRo) ; numofsamples = 10000 ;
paprvector = linspace(samplemin,samplemax,numofsamples) ;
    
for k = 1:length(paprvector)
    cumulative(k) = length(find(PAPRo <= paprvector(k))) / (length(IFFTo)/64) ; 
end
cumulative = ones(1,length(cumulative)) - cumulative ;
plot(paprvector,log10(cumulative),'b') ;
hold on ;
alphaA = 7.6 ;
theoryaxis = linspace(samplemin,samplemax,10000) ;
theoryccdf = 1-(1-exp(-theoryaxis)).^(alphaA*64);
plot(paprvector,log10(theoryccdf)) ;
hold on ;