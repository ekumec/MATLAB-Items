clear all ; clc ; 
FFTCount = 1000; Modorder = 64 ;
databits = randi([0 1],1,FFTCount*48*log2(Modorder)) ;
pilotbits = randi([0 1],1,FFTCount*4) ;
datastart = 6 ;
prefixlen = 16 ;
lengthEbNo = 10 ; incEbNo = 0.5 ;
[pilotmat,dataseq] = SixtyFourQAMBPSKPilot(pilotbits,databits) ;
pilotloc = [11 25 39 53] ;sampspersym = 128 ;
bitcount = (60*log2(Modorder)+4)*(sampspersym) ;
errorcount = [] ;
EbNoaxis = [] ; errorcount = [] ;
rolloff = 0.8 ; numsym = 1 ;
%the for loop for BER performance will start here
for EbNo = 1:incEbNo:lengthEbNo
    
    LinearEbNo = 10^(EbNo/10) ;
    LinearSNR = (LinearEbNo*48)/(80*sampspersym) ; 
    SNR = 10*log10(LinearSNR) + log10(1/32)-0.2;
    temp64 = [] ;
    tempdatamat = [] ;
    temppilotmat = [] ;
    IFFTi = [] ;
    pilotloctemp = [] ; %temporarily holds the locations of the pilots and guards
    guardpilotloc = [] ; %locations of all guards and pilots
    
    for w = 1:FFTCount
        
        tempdatamat = dataseq(1,48*w-47:48*w) ;
        temppilotmat = pilotmat(1,4*w-3:4*w) ;
        [temp64,pilotloctemp] = AddGuardPilot2(pilotloc,temppilotmat,datastart,tempdatamat) ;
        IFFTi = [IFFTi,temp64] ;
        guardpilotloc = [guardpilotloc, pilotloctemp ] ;
        
    end
    
    IFFTi64 = [] ; %a chunk of 64 IFFT input symbols
    IFFTo = [] ; %total IFFT output
    IFFTtemp = [] ; %temporary matrix to hold the output of the chunks
    
    for m = 1:FFTCount
        
        IFFTi64 = IFFTi(1,m*64-63:m*64) ;
        IFFTtemp = ThirtyTwoPointtoSixtyFourPointIFFT(IFFTi64) ;
        IFFTo = [IFFTo , IFFTtemp ] ;
        
    end
    CPintemp = [] ; %temporary matrix to hold chunks of 64 for CP
    CPouttemp = [] ; %temporary matrix to hold output of chunks, will be length 80
    CPo = [] ; %total output of CP

    for q = 1:FFTCount
        
        CPintemp = IFFTo(1,q*64-63:q*64) ;
        CPouttemp = AddCyclicPrefix(CPintemp,prefixlen) ;
        CPo = [CPo, CPouttemp] ;
        
    end

    lenupconv = length(CPo) ;
    filtlength = numsym*sampspersym+1 ;
    h1 = SRRCFeyzi2(rolloff,sampspersym,filtlength) ;
    h2 = SRRCFeyzi2(rolloff,sampspersym,filtlength) ;
    upsampo = UpSampler(CPo,sampspersym) ;
    lenpersym = numsym*sampspersym+length(h1)-1-(length(h1)-1) ;
    lentotal = lenpersym*length(CPo) ;
    totalout = zeros(1,lentotal) ;
    maxsig = max(CPo) ;
    tempi = [] ; tempo = [] ; clearout = [] ; start = 1;

    for in = 1:sampspersym:length(upsampo)
        
        tempi = upsampo(1,in:in+sampspersym-1) ;
        tempo = myconv(tempi,h1) ;
        clearout = ClearFilterOutput(tempo,length(h1)) ;
        totalout(1,start:start+lenpersym-1) = clearout ;
        start = start+lenpersym ;
        
    end

    %%add noise from here

    noise = AddAWGN3(totalout,SNR) ;
    noise = noise/2 ;
    upconvout = totalout+noise ;
    
    %%add noise to here 

    rxtempi = [] ; rxtempo = [] ; rxclearout = [] ; start = 1 ;
    rxtotalout = zeros(1,lentotal) ;

    A = 12;

    upconvout = [ upconvout ones(1,A-1)];

    for in = A+1:lenpersym:length(upconvout)-A*lenpersym
        
        rxtempi = upconvout(1,in:in+lenpersym-1);
        rxtempo = myconv(rxtempi,h1) ;
        rxclearout = ClearFilterOutput(rxtempo,length(h1)) ;
        rxtotalout(1,start:start+lenpersym-1) = rxclearout ;
        start = start+lenpersym ;
        
    end
    
    downsampo = DownSampler(rxtotalout,sampspersym) ;

    RCPintemp = [] ; %temporary input for the cyclic prefix remover
    RCouttemp = [] ; %temporary output for the cyclic prefix remover
    RCo = [] ; %total output

    for n = 1:FFTCount
        
        RCPintemp = downsampo(1,n*(64+prefixlen)-(64+prefixlen-1):n*(64+prefixlen)) ;
        RCouttemp = RemoveCyclicPrefix(RCPintemp,prefixlen) ;
        RCo = [RCo,RCouttemp] ;
        
    end

    FFTi = RCo ;
    FFTitemp = [] ; %taking temporary input
    FFTotemp = [] ; %taking temporary output for the FFT
    FFTo = [] ; %total FFT output

    for m = 1:FFTCount
        
        FFTitemp = FFTi(1,64*m-63:64*m) ;
        FFTotemp = ThirtyTwotoSixtyFourPointFFT(FFTitemp) ;
        FFTo = [FFTo,FFTotemp] ;
        
    end

    demodin = RemoveGuardPilot(FFTo,guardpilotloc) ;
    demodout = SixtyFourQAMDemodulator(demodin) ;
    errcount = 0 ; correctcount = 0 ; %disp(length(databits)) ; disp(length(demodout)) ;
    
    for o = 1:length(demodout)
        
        if(demodout(1,o) == databits(1,o))
            correctcount = correctcount + 1 ;
        else
            errcount = errcount + 1 ;
        end
        
    end
    
    disp(correctcount) ; disp(errcount) ;
    errorcount = [errorcount , errcount ] ;
    EbNoaxis = [EbNoaxis,EbNo] ;
    
end

%end the for loop BER here
errorcount = errorcount ./ length(databits) ;
errorcount = log10(errorcount) ;
figure(1) ; 
plot(EbNoaxis,errorcount,'-x') ;
hold on ; linearSNR = 10.^(EbNoaxis./10) ;
linearSNR = linearSNR*(64/48) ; k = 6 ;
Pb1 = (1/8)*(erfc(sqrt(linearSNR/7/k))+erfc(3*sqrt(linearSNR/7/k))+erfc(5*sqrt(linearSNR/7/k))+erfc(7*sqrt(linearSNR/7/k))) ;
Pb2 = (1/8)*(2*erfc(sqrt(linearSNR/7/k)) + 2*erfc(3*sqrt(linearSNR/7/k)) + erfc(5*sqrt(linearSNR/7/k)) + erfc(7*sqrt(linearSNR/7/k)) - erfc(9*sqrt(linearSNR/7/k)) - erfc(11*sqrt(linearSNR/7/k)) ) ;
Pb3 = (1/8)*(4*erfc(sqrt(linearSNR/7/k)) + 3*erfc(3*sqrt(linearSNR/7/k)) - 3*erfc(5*sqrt(linearSNR/7/k)) - 2*erfc(7*sqrt(linearSNR/7/k)) + 2*erfc(9*sqrt(linearSNR/7/k)) + erfc(11*sqrt(linearSNR/7/k)) - erfc(13*sqrt(linearSNR/7/k))) ;
Pb = (1/3)*(Pb1 + Pb2 + Pb3) ;
plot(EbNoaxis,log10(Pb),'-o') ;