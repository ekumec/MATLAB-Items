function [bpskout,sixtyfourqamout] = SixtyFourQAMBPSKPilot(bpskmat,sixtyfourqammat)
    sixtyfourqamout = SixtyFourQAMModulator(sixtyfourqammat) ;
    bpskout = BPSKModulator(bpskmat) ;
end