function [noisyIm] = addMotionBlur(im,t)
% Description:
% Adds Motion Blur to image
% Inputs:
% im - a grayscale image array in the range [0..255]
% t - length of blur filter.  (Equivalent to the length of time over which the camera integrates the sensor input for a camera moving at 1 pixel per time unit)
% Outputs:
% noisyIm - grayscale image in the range [0..255] same size as im
% Author:
% Name - Evgeny Ostrovsky
% Email - evgeny17387@gmail.com
    
    noisyIm = im;

end
