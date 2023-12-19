function [modulation, targetCodeRate] = CQI2MCS(CQI, table)
    % Table 5.2.2.1-2 (3GPP TS 38.214)
    if (strcmpi(table,'Table1'))
        modulations = {'QPSK'; 'QPSK'; 'QPSK'; 'QPSK'; 'QPSK'; 'QPSK'; '16QAM'; '16QAM'; '16QAM'; '64QAM'; '64QAM'; '64QAM'; '64QAM'; '64QAM'; '64QAM'};
        codingRates = [78; 120; 193; 308; 449; 602; 378; 490; 616; 466; 567; 666; 772; 873; 948];
        modulation = cell2mat(modulations(CQI));
        targetCodeRate = codingRates(CQI);

    % Table 5.2.2.1-3 (3GPP TS 38.214)
    elseif (strcmpi(table,'Table2'))
        modulations = {'QPSK'; 'QPSK'; 'QPSK'; '16QAM'; '16QAM'; '16QAM'; '64QAM'; '64QAM'; '64QAM'; '64QAM'; '64QAM'; '256QAM'; '256QAM'; '256QAM'; '256QAM'};
        codingRates = [78; 193; 449; 378; 490; 616; 466; 567; 666; 772; 873; 711; 797; 885; 948];
        modulation = cell2mat(modulations(CQI));
        targetCodeRate = codingRates(CQI);
    end
end