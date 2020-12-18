function [noisyIm] = addGaussianNoise(im, s)
% Description:
% Adds Gaussian noise to image
% Inputs:
% im - a grayscale image array in the range [0..255]
% s  - the std to be used for Gaussian distribution of noise
% Outputs:
% NoisyIm - grayscale image in the range [0..255] same size as im
% Author:
% Name - Evgeny Ostrovsky
% Email - evgeny17387@gmail.com
    
    noisyIm = im + s * randn(size(im, 1), size(im, 2));

end
