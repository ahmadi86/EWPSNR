%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Description
% This file generates a gaussian-weighted map based on the gaze location   
%
% Inputs
% SigX: Standard deviation along X axis (based on Horizontal FOV 
%       and distance from display)
% SigY: Standard deviation along Y axis (based on Vertical FOV 
%       and distance from display)
% Width: Width of the video in pixel
% Height: Height of the vide in pixel
% GLX: X component of the gaze location in pixel, X axis starts from
% upper-left corner and continues towards right   
% GLY: Y component of the gaze location in pixel, Y axis starts from
% upper-left corner and continues towarsds down
% Output
% EWMap: A map of (Height, Width) size, each element contains the corresponding
% weight for its position 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function EWMap = CalculateEWMap(SigmaX, SigmaY, Width, Height, GLX, GLY)	
    EWMap = zeros(Height, Width);

    for X = 1 : Width
        for Y = 1 : Height             
            TermX = ((X - GLX) .^ 2) / (2 * (SigmaX .^ 2));
            TermY = ((Y - GLY) .^ 2) / (2 * (SigmaY .^ 2));
            A = exp(-(TermX + TermY));
            EWMap(Y, X) = A / (2 * pi * SigmaX * SigmaY);
        end   
    end
end