function [cleanIm] = cleanImageMedian_multi(imArray)
% Description:
% Denoises a series of images using median filtering across corresponding pixels
% Inputs:
% imArray - a 3D array in the range [0..255]. Every frame imArray(:,:,i) is an image
% Outputs:
% cleanIm - grayscale image in the range [0..255] same size as a frame in imArray
% Author:
% Name - Evgeny Ostrovsky
% Email - evgeny17387@gmail.com

    cleanIm = squeeze(median(imArray, 1));

end
