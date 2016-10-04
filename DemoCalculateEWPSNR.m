%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description
% This file contains a demonstration on how to call 
% CalculateEWPSNR function   
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function DemoCalculateEWPSNR()
    GLX = 680;
    GLY = 450;
    SigmaX = 65;
    SigmaY = 65;
    Width = 1280;
    Height = 720;
    n = 8;
    
    % if the sample is not available you can use following simple matrixes
%     OriginalFrame = ones(Height, Width);
%     ReconstructedFrame = zeros(Height, Width);        

    SampleData = load('sample.mat');
    OriginalFrame = SampleData.original;
    ReconstructedFrame = SampleData.reconstructed;
    
    % calculation
    EWMap = CalculateEWMap(SigmaX, SigmaY, Width, Height, GLX, GLY);	
    EWMSE = CalculateEWMSE(OriginalFrame, ReconstructedFrame, EWMap);
    EWPSNR = CalculateEWPSNR(EWMSE, n);

    % print results
    display(['EWMSE: ' num2str(EWMSE)]);
    display(['EWPSNR: ' num2str(EWPSNR)]);
    
    % save some images 
    figOriginal = figure;
    imagesc(OriginalFrame)
    colormap(gray);
    print(gcf(), '-dpng', 'Original');
    close(figOriginal);
    
    %
    figReconstructed = figure;
    imagesc(ReconstructedFrame)
    colormap(gray);
    print(gcf(), '-dpng', 'Reconstructed');
    close(figReconstructed);
    
    %
    figEWMap = figure;
    imagesc(EWMap)
    colormap(gray);
    print(gcf(), '-dpng', 'EWMap');
    close(figEWMap);    
end