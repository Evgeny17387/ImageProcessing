function [bimg] = binarize(img, T)
% Description:
% This function calculates binarized image of an image by giving thershold
% Inputs:
% img - image
% T - threshold for binarization 0 and 255
% Outputs:
% bimg - binarized image
% Author:
% Name - Evgeny Ostrovsky
% Email - evgeny17387@gmail.com

    bimg = zeros(size(img));
    bimg(img > T) = 2 ^ 8 - 1;

end
