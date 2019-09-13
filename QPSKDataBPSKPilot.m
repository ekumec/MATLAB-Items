function [bpskout,qpskout] = QPSKDataBPSKPilot(bpskmat,qpskmat)
    bpskout = BPSKModulator(bpskmat) ;
    qpskout = QPSKModulator(qpskmat) ;
end