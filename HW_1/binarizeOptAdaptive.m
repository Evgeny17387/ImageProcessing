function [bimg] = binarizeOptAdaptive(im, winsize)
    
    bimg = im;

    for i = 1 : size(im, 1) - winsize + 1
        
        for j = 1 : size(im, 2) - winsize + 1
            
            [~, Qvals] = optimalQuantization(im(i: i + winsize - 1, j: j + winsize - 1), 1);

            T = (Qvals(1) + Qvals(2)) / 2;
            
            bimg(i + round(winsize / 2), j + round(winsize / 2)) = binarize(im(i + round(winsize / 2), j + round(winsize / 2)), T);

        end
        
    end
    
end
