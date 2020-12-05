function [newIm] = mapQuad(im, pointsSet1, pointsSet2, transformType)
% Description:
% Maps image im using the affine transform T into an image of size sizeOutIm. Uses Bilinear Interpolation
% Inputs:
% pointsSet1, pointsSet2 – array 2XN of coordinates of the form [x1,x2,x3…; y1, y2, y3…] representing quads
% Outputs:
% newIm - a grayscale image in the range [0..255] same size of im with patch copied from quad defined by pointsSet1  to quad defined by pointsSet2
% Author:
% Name - Evgeny Ostrovsky
% Email - evgeny17387@gmail.com

    newIm = im;

    switch transformType
        case 0
            T = findAffineTransform(pointsSet2, pointsSet1);
        case 1
            T = findProjectiveTransform(pointsSet2, pointsSet1);
    end
    
    min_x = min(pointsSet2(1, :));
    min_y = min(pointsSet2(2, :));
    max_x = max(pointsSet2(1, :));
    max_y = max(pointsSet2(2, :));
    
    for x = min_x: max_x
        for y = min_y: max_y
            if inpolygon(x, y, pointsSet2(1, :)', pointsSet2(2, :)')
                X_tag = T * [x, y, 1]';
                newIm(floor(y), floor(x)) = im(floor(X_tag(2, 1)), floor(X_tag(1, 1)));
            end
        end
    end
    
end
