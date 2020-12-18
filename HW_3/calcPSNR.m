function [PSNRval] = calcPSNR(noisyIm, im)
% Description:
% This function calculates the Peak-Signal_to-Noise-Ratio (PSNR) of a noisy image compared to the original image
% Inputs:
% im - grayscale image (array of values in [0..255]) same size as noisyIm
% noisyIm - grayscale image (array of values in [0..255])
% Outputs:
% PSNRval - a Real value expressing the PSNR of noisyIm
% Author:
% Name - Evgeny Ostrovsky
% Email - evgeny17387@gmail.com

    mn = size(im, 1) * size(im, 2);
    MSE = (1/mn) * sum(sum((im - noisyIm) .^ 2));
    PSNRval = 10 * log10((255 ^ 2) / MSE);

end
