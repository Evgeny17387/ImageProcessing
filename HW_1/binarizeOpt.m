function [bimg, T] = binarizeOpt(im)

    [~, Qvals] = optimalQuantization(im, 1);
    
    T = (Qvals(1) + Qvals(2)) / 2;
    
    bimg = binarize(im, T);

end
