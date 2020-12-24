function [sharpIm] = sharpen(im, maskRadius, maskSTD, lambda)
% Description:
% This function applies sharpening using convolution
% Inputs:
% im - grayscale image (array of values in [0..255])
% maskRadius – a 1x2 vector [numRows,numCols]. Defines neighborhood size to be 2*maskRadius + 1. Thus neighborhood at x is (x-maskRadius) : (x+maskRadius)
% lambda – the strength of the sharpening to apply
% Outputs:
% sharpIm - grayscale image (array of values in [0..255])  - same size as im
% Author:
% Name - Evgeny Ostrovsky
% Email - evgeny17387@gmail.com

    [X, Y] = meshgrid(-maskRadius(1) : maskRadius(1), -maskRadius(2) : maskRadius(2));
    gaussianKernel = exp(-(X .^ 2 + Y .^ 2) / (2 * maskSTD * maskSTD)) / (maskSTD * sqrt(2 * pi));
    gaussianKernel = gaussianKernel / sum(sum(gaussianKernel));
    
    deltaKernel = zeros(2 * maskRadius(1) + 1, 2 * maskRadius(2) + 1);
    deltaKernel(maskRadius(1) + 1, maskRadius(2) + 1) = 1;
    
    sKernel = deltaKernel + lambda * (deltaKernel - gaussianKernel);

    sharpIm = conv2(im, sKernel, "Same");

end
 