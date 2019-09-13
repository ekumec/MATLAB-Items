function [bpskout,sixteenqamout] = SixteenQAMDataBPSKPilot(bpskmat,sixteenqammat)
    bpskout = BPSKModulator(bpskmat) ;
    sixteenqamout = SixteenQAMModulator(sixteenqammat) ;
end