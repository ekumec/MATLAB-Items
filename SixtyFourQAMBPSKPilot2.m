function [bpskout,sixtyfourqamout] = SixtyFourQAMBPSKPilot2(bpskmat,sixtyfourqammat)
    sixtyfourqamout = SixtyFourQAMModulator2(sixtyfourqammat) ;
    bpskout = BPSKModulator(bpskmat) ;
end