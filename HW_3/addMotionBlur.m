function [noisyIm] = addMotionBlur(im, t)
% Description:
% 
% Inputs:
% im - a grayscale image array in the range [0..255]
% t - 
% maskSTD - standart deviation of the gaussian kernel for mean summation
% Outputs:
% noisyIm - grayscale image in the range [0..255] same size as im
% Author:
% Name - Evgeny Ostrovsky
% Email - evgeny17387@gmail.com
    
    motionalKernel = ones(1, t) * (1 / t);

    noisyIm = conv2(im, motionalKernel, "Same");

end
