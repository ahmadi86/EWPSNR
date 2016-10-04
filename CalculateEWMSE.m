%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description
% This file calculates the Eye-tracking Weighted MSE (EWMSE)   
%
% Inputs
% Forg: Original Y frame
% Frec: Reconstructed Y frame
% Map: Eye-tracking based weight map
%
% Output
% EWMSE: The amount of EWMSE
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function EWMSE = CalculateEWMSE(Forg, Frec, Map)
    [SHeight, Swidth] = size(Map);

    Temp = 0;
    for X = 1 : Swidth
        for Y = 1 : SHeight
            Temp = Temp + (Map(Y, X) * ((Frec(Y, X) - Forg(Y, X)) .^ 2));
        end
    end
    
    EWMSE = Temp / sum(sum(Map));
end