function [cleanIm] = cleanImageMedian(im, maskRadius)
% Description:
% Denoises image using median filtering
% Inputs:
% im - a grayscale image array in the range [0..255]
% maskRadius - a 1x2 vector [numRows,numCols]
% Outputs:
% cleanIm - grayscale image in the range [0..255] same size as im
% Author:
% Name - Evgeny Ostrovsky
% Email - evgeny17387@gmail.com

    cleanIm = im;
    
    maskRadiusY = maskRadius(1);
    maskRadiusX = maskRadius(2);

    for y = 1 + maskRadiusY : size(im, 1) - maskRadiusY

        for x = 1 + maskRadiusX : size(im, 2) - maskRadiusX

            cleanIm(y, x) = median(reshape(im(y - maskRadiusY : y + maskRadiusY, x - maskRadiusX : x + maskRadiusX), 1, []));

        end

    end

end
