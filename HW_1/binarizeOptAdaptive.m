function [bimg] = binarizeOptAdaptive(im, winsize)

    bimg = im;

    for i = 1 : 1 : size(im, 1) - winsize
        
        for j = 1 : 1 : size(im, 2) - winsize

            [~, Qvals] = optimalQuantization(im(i: i + winsize - 1, j: j + winsize - 1), 1);

            T = (Qvals(1) + Qvals(2)) / 2;

            bimg(i: i + winsize - 1, j: j + winsize - 1) = binarize(im(i: i + winsize - 1, j: j + winsize - 1), T);

        end
        
    end
    
end
