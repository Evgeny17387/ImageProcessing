function [bimg] = binarize(img, T)

    bimg = zeros(size(img));
    bimg(img > T) = 2 ^ 8 - 1;

end
