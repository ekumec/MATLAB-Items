function y = AddAWGN2(signal,SNR)
    signalpower = sum(abs(signal).^2) / (length(signal)) ;
    noisefirst = randn(1,length(signal)) ;
    if(imag(signal) ~= zeros(1,length(signal)))
        noisefirst = noisefirst + 1j*randn(1,length(signal));
    end
    noisepower1 = sum(abs(noisefirst).^2) / (length(noisefirst)) ;
    SNRfirst = 10*log10(signalpower/noisepower1);
    SNRsecond = SNR ;
    noisepower2 = noisepower1*(10^(SNRfirst/10)/10^(SNRsecond/10)) ;
    noisesecond = noisefirst*sqrt(noisepower2) / sqrt(noisepower1) ;
    noisepowertry = sum(abs(noisesecond).^2) ;
    y = signal + noisesecond ;
    disp(snr(signal,noisesecond)) ;
end