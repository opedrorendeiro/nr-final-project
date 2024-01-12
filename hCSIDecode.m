function [new_modulation,new_codeRate,wtx,ri] = hCSIDecode(carrier,pdsch,pdschextra,csiReports,csiFeedbackOpts)
    
    [modulation, targetCodeRate] = CQI2MCS(csiReports.CQI(1), csiFeedbackOpts.CSIReportConfig.CQITable);
    if pdsch.NumCodewords > 1                             % Multicodeword transmission (when number of layers being > 4)
        new_modulation = {modulation,modulation};             % 'QPSK', '16QAM', '64QAM', '256QAM'
        new_codeRate = [targetCodeRate targetCodeRate]/1024;   % Code rate used to calculate transport block sizes
    else
        new_modulation = {modulation};                       % 'QPSK', '16QAM', '64QAM', '256QAM'
        new_codeRate = targetCodeRate/1024;         % Code rate used to calculate transport block sizes
    end
    wtx = csiReports.wtx;
    ri = csiReports.RI;
end