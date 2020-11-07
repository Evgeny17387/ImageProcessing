function [bimg, T] = binarizeOpt(im)
% Description:
% This function calculates optimal binarized image of an image using threshold calculated by the optimal quantization for 1 Bin
% Inputs:
% im - image
% Outputs:
% bimg - optimal binarized image
% T - threshold for binarization 0 and 255
% Author:
% Name - Evgeny Ostrovsky
% Email - evgeny17387@gmail.com

    [~, Qvals] = optimalQuantization(im, 1);
    
    T = (Qvals(1) + Qvals(2)) / 2;
    
    bimg = binarize(im, T);

end
