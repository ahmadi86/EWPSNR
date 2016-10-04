%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description
% This file calculates the Eye-tracking Weighted PSNR (EWPSNR)   
%
% Inputs
% EWMSE: Eye-tracking Weighted MSE (EWMSE)
% n: bit depth  (for example 8bit)
%
% Output
% EWPSNR: The amount of EWPSNR
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function EWPSNR = CalculateEWPSNR(EWMSE, n)
    signalMax = (2 .^ n) - 1;
    EWPSNR = 10 * log10((signalMax .^ 2) / EWMSE); 
end