function [bimg] = binarizeOptAdaptive(im, winsize)
% Description:
% This function calculates adaptive optimal binarized image of an image using sliding window with local thresholds
% Inputs:
% im - image
% winsize - slidng window size
% Outputs:
% bimg - adaptive optimal binarized image
% Author:
% Name - Evgeny Ostrovsky
% Email - evgeny17387@gmail.com
    
    bimg = im;

    for i = 1 : size(im, 1) - winsize + 1
        
        for j = 1 : size(im, 2) - winsize + 1
            
            [~, Qvals] = optimalQuantization(im(i: i + winsize - 1, j: j + winsize - 1), 1);

            T = (Qvals(1) + Qvals(2)) / 2;
            
            bimg(i + round(winsize / 2), j + round(winsize / 2)) = binarize(im(i + round(winsize / 2), j + round(winsize / 2)), T);

        end
        
    end
    
end
