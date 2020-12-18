function [noisyIm] = addSPnoise(im, p)
% Description:
% Adds Salt & Pepper noise to image
% Inputs:
% im - a grayscale image array in the range [0..255]
% p - proportion of pixels that will be noisy
% Outputs:
% NoisyIm - grayscale image in the range [0..255] same size as im
% Author:
% Name - Evgeny Ostrovsky
% Email - evgeny17387@gmail.com
    
    noisyIm = im;
    
    randomPortionPPixels = round(numel(im) * p);
    randomPortionPPixelsPositions = randi([1, numel(im)], 1, randomPortionPPixels);

    noisyIm(randomPortionPPixelsPositions(1:round(randomPortionPPixels/2))) = 0;
    noisyIm(randomPortionPPixelsPositions(round(randomPortionPPixels/2):randomPortionPPixels)) = 255;

end
