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

    switch transformType
        case 0
            T = findAffineTransform(pointsSet1, pointsSet2);
        case 1
            T = findProjectiveTransform(pointsSet1, pointsSet2);
    end
    
    newIm = im;

end
