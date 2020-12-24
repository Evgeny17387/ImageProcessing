function [cleanIm] = cleanImageMean(im, maskRadius, maskSTD)
% Description:
% Denoises image using mean filtering
% Inputs:
% im - a grayscale image array in the range [0..255]
% maskRadius - a 1x2 vector [numRows,numCols]
% maskSTD - standart deviation of the gaussian kernel for mean summation
% Outputs:
% cleanIm - grayscale image in the range [0..255] same size as im
% Author:
% Name - Evgeny Ostrovsky
% Email - evgeny17387@gmail.com

    [X, Y] = meshgrid(-maskRadius(1) : maskRadius(1), -maskRadius(2) : maskRadius(2));
    gaussianKernel = exp(-(X .^ 2 + Y .^ 2) / (2 * maskSTD * maskSTD)) / (maskSTD * sqrt(2 * pi));
    gaussianKernel = gaussianKernel / sum(sum(gaussianKernel));

    sum(sum(gaussianKernel))
    
    cleanIm = conv2(im, gaussianKernel, "Same");

end
