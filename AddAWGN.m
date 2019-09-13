function [y,noisevar] = AddAWGN(signal,SNR)
    signalpower = sum(abs(signal).^2) / (length(signal)) ;
    noisefirst = randn(1,length(signal)) ;
    if(isreal(signal) == 0)
        noisefirst = noisefirst + 1j*randn(1,length(signal));
    end
    NoiseNormalized = NormalizeSignal(noisefirst) ;
    noisepower = signalpower/(10.^(SNR./10)) ;
    noiselast = sqrt(noisepower).*NoiseNormalized ;
    SNRtry = 10*log10(signalpower/(sum(abs(noiselast).^2)/length(noiselast))) ;
    out = signal + noiselast ;
    y = out ;
    noisevar = var(noiselast) ;
end