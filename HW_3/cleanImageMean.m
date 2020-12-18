function [cleanIm] = cleanImageMean(im, maskRadius, maskSTD)
% Description:
% Denoises image using mean filtering
% Inputs:
% im - a grayscale image array in the range [0..255]
% maskRadius - a 1x2 vector [numRows,numCols]
% Outputs:
% cleanIm - grayscale image in the range [0..255] same size as im
% Author:
% Name - Evgeny Ostrovsky
% Email - evgeny17387@gmail.com

    gaussianKernel = fspecial('gaussian', 2 * maskRadius + 1, maskSTD);

    cleanIm = conv2(im, gaussianKernel, "Same");

end
