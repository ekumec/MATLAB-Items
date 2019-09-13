%BERTestBPSKtotalsystem
clc ; clear all ;
FFTCount = 1000; %determines the amount of times that the 64-FFT operation will be done 
databits = randi([0 1],1,FFTCount*48) ; %generates the databits for each subcarrier pack, each subcarrier pack consisting of 64 subcarriers
pilotbits = CopyMatrices([1 0 1 1],FFTCount*4) ; %generating the pilotbits for each subcarrier pack
datastart = 6; %determines from which subcarrier the data shall start
Modorder = 2 ; %modulation order for each data subcarrier
k = log2(Modorder) ; %bits per data subcarrier
numsym = 1 ;
prefixlen = 16; %prefix length
lengthEbNo = 10 ; %maximum amount of SNR used for BER test
incEbNo = 0.5; %amount of increase in SNR between subsequent tests
dataseq = BPSKModulator(databits) ; %generating the modulated data sequence with respect to the required modulation scheme
sampspersym = 128 ;
bitcount = (64+prefixlen)*(FFTCount)*(sampspersym) ;
rolloff = 0.5 ;
pilotmat = BPSKModulator(pilotbits) ; pilotloc = [11 25 39 53] ;
errorcount = [] ; EbNoaxis = [] ;
bandwidth = 20e6 ; bitrate = 6e6 ;
for EbNo = 1:incEbNo:lengthEbNo
SNR = EbNo+10*log10(48/64)+10*log10(64/80)+10*log10(1/sampspersym);
subcarseq = [] ;
data = [] ;
guardpilotloc = [] ;
z = [] ;
for t = 1:FFTCount
    data = dataseq(1,48*t-47:48*t) ;
    pilotdata = pilotmat(1,t*4-3:t*4) ;
    [symbolx, z] = AddGuardPilot2(pilotloc,pilotdata,datastart,data) ;
    subcarseq = [subcarseq,symbolx] ;
    guardpilotloc = [guardpilotloc,z] ;
end
IFFTo = [] ;
IFFTi = [] ;
for i = 1:FFTCount
    IFFTi = subcarseq(1,i*64-63:64*i) ;
    z = ThirtyTwoPointtoSixtyFourPointIFFT(IFFTi) ;
    IFFTo = [IFFTo,z] ;
end
upconvin = [] ;
CPin = [] ;
tempout = [] ;

for i = 1:FFTCount
    CPin = IFFTo(1,i*64-63:i*64) ;
    tempout = AddCyclicPrefix(CPin,prefixlen);
    upconvin = [upconvin,tempout];
end
RCPin = [] ;
temp = [] ;
FFTi = [] ;
lenupconv = length(upconvin) ;
filtlength = numsym*sampspersym+1 ;
h1 = SRRCFeyzi(rolloff,sampspersym,filtlength) ;
h2 = SRRCFeyzi(rolloff,sampspersym,filtlength) ;
upsampo = UpSampler(upconvin,sampspersym) ;
lenpersym = numsym*sampspersym+length(h1)-1-(length(h1)-1) ;
lentotal = lenpersym*length(upconvin) ;
totalout = zeros(1,lentotal) ;
maxsig = max(upconvin) ;
tempi = [] ; tempo = [] ; clearout = [] ; start = 1;

for in = 1:sampspersym:length(upsampo)
    tempi = upsampo(1,in:in+sampspersym-1) ;
    tempo = myconv(tempi,h1) ;
    clearout = ClearFilterOutput(tempo,length(h1)) ;
    totalout(1,start:start+lenpersym-1) = clearout ;
    start = start+lenpersym ;
end

%Adding noise starts here

downconvin = AddAWGN2(totalout,SNR) ;

%Adding noise ends here

rxtempi = [] ; rxtempo = [] ; rxclearout = [] ; start = 1 ;
rxtotalout = zeros(1,lentotal) ;

for in = 1:lenpersym:length(totalout)
    rxtempi = downconvin(1,in:in+lenpersym-1);
    rxtempo = myconv(rxtempi,h1) ;
    rxclearout = ClearFilterOutput(rxtempo,length(h1)) ;
    rxtotalout(1,start:start+lenpersym-1) = rxclearout ;
    start = start+lenpersym ;
end

downsampo = DownSampler(rxtotalout,sampspersym) ;


for i = 1:FFTCount
    RCPin = downsampo(1,i*(64+prefixlen)-(64+prefixlen-1):i*(64+prefixlen)) ;
    temp = RemoveCyclicPrefix(RCPin,prefixlen) ;
    FFTi = [FFTi,temp] ;
end
FFTintemp = [] ;
tempFFTo = [] ;
FFTo = [] ;
for i = 1:FFTCount
    FFTintemp = FFTi(1,i*64-63:i*64) ;
    tempFFTo = ThirtyTwotoSixtyFourPointFFT(FFTintemp) ;
    FFTo = [FFTo,tempFFTo] ;
end

demodin = RemoveGuardPilot(FFTo,guardpilotloc) ;
demodout = BPSKDemodulator(demodin) ;
errcount = 0 ; corrcount = 0 ;
for i = 1:length(databits)
    if(databits(1,i) == demodout(1,i))
        corrcount = corrcount+1 ;
    else
        errcount = errcount + 1 ;
    end
end
disp(['errorcount',num2str(errcount)]) ; 
disp(['correctcount',num2str(corrcount)]) ;
errorcount = [errorcount , errcount] ;
EbNoaxis = [ EbNoaxis , EbNo ] ;
end
errorcount = errorcount / (length(databits)) ;
errorcount = log10(errorcount) ;
figure(1)
plot(EbNoaxis,errorcount, '-x') ;
hold on ;
linearSNR = 10.^(EbNoaxis./10) ;
tber=qfunc(sqrt(2*linearSNR*(48/64))) ;
plot(EbNoaxis,log10(tber),'-o') ;
hold on ;
