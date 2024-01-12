function csiReport = hCSIEncode(carrier,csirs,Hest,nVar,csiFeedbackOpts,newWtx,nslot)

%     %% 6. FILL RI, CQI AND PMI PARAMETERS
numLayers = hRISelect(carrier,csirs,csiFeedbackOpts.CSIReportConfig,Hest,nVar);

% Calculate CQI and PMI values using practical channel estimate
[cqi,pmi,cqiInfo] = hCQISelect(carrier,csirs, ...
    csiFeedbackOpts.CSIReportConfig,numLayers,Hest,nVar);
numCodeWordsPr = size(cqi,2);
numSBs = size(cqi,1);

% Store CQI, PMI, RI, and subband SINR values of each slot for the
% practical channel estimation scenario. Because the number of
% codewords can vary based on the rank, append NaNs to the
% CQI-related variables to account for the second codeword
% information in the slots where only one codeword is present.

csiReport = struct();

csiReport.RI = numLayers;
csiReport.CQI = [cqi NaN(numSBs,2-numCodeWordsPr)];
csiReport.PMI = pmi;
csiReport.subbandCQI = [cqiInfo.SubbandCQI NaN(numSBs,2-numCodeWordsPr)];
csiReport.SINRPerSubbandPerCW = [cqiInfo.SINRPerSubbandPerCW NaN(numSBs,2-numCodeWordsPr)];
csiReport.Hest = Hest;
csiReport.wtx = newWtx;
csiReport.NSlot = nslot;

% riPerSlot(1,slotIdx+1) = numLayers; %#ok<SAGROW> 
% cqiPerSlot(:,:,slotIdx+1) = [cqi NaN(numSBs,2-numCodeWordsPr)]; %#ok<SAGROW> 
% pmiPerSlot(slotIdx+1) = pmi;
% subbandCQI(:,:,slotIdx+1) = [cqiInfo.SubbandCQI NaN(numSBs,2-numCodeWordsPr)]; %#ok<SAGROW> 
% SINRPerSubbandPerCW(:,:,slotIdx+1) = [cqiInfo.SINRPerSubbandPerCW NaN(numSBs,2-numCodeWordsPr)]; %#ok<SAGROW> 

% Calculate the RI value using perfect channel estimate
% numLayersPerfect = hRISelect(simParameters.Carrier,simParameters.CSIRS,reportConfig,PerfectHest,nVarPerfect);
% 
% % Calculate CQI and PMI values using perfect channel estimate
% [cqiPerfect,pmiPerfect,cqiInfoPerfect] = hCQISelect(simParameters.Carrier,simParameters.CSIRS, ...
%     reportConfig,numLayersPerfect,PerfectHest,nVarPerfect);
% numCodeWordsPe = size(cqiPerfect,2);
% 
% % Store CQI, PMI, RI, and subband SINR values of each slot for the
% % perfect channel estimation scenario. Because the number of
% % codewords can vary based on the rank, append NaNs to the
% % CQI-related variables to account for the second codeword
% % information in the slots where only one codeword is present.
% riPerfectPerSlot(1,slotIdx+1) = numLayersPerfect; %#ok<SAGROW> 
% cqiPerfectPerSlot(:,:,slotIdx+1) = [cqiPerfect NaN(numSBs,2-numCodeWordsPe)]; %#ok<SAGROW> 
% subbandCQIPerfect(:,:,slotIdx+1) = [cqiInfoPerfect.SubbandCQI NaN(numSBs,2-numCodeWordsPe)]; %#ok<SAGROW> 
% pmiPerfectPerSlot(slotIdx+1) = pmiPerfect;
% SINRPerSubbandPerCWPerfect(:,:,slotIdx+1) = [cqiInfoPerfect.SINRPerSubbandPerCW NaN(numSBs,2-numCodeWordsPe)]; %#ok<SAGROW>
% 
% csiReport = zeros();

end