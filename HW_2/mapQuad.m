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

    min_x = floor(min(pointsSet2(1, :)));
    min_y = floor(min(pointsSet2(2, :)));
    max_x = floor(max(pointsSet2(1, :)));
    max_y = floor(max(pointsSet2(2, :)));

    [X, Y] = meshgrid(min_x: max_x, min_y: max_y);

    % Check what pixles inside and outside the polygon
    inpolygon_points = inpolygon(X, Y, pointsSet2(1, :)', pointsSet2(2, :)');
    
    % Calculate all pixels (inside and outside the polygon) source pixels using the transformation matrix
    X_tag = T * [X(:), Y(:), ones(size(X(:)))]';
    X_tag_x = X_tag(1, :);
    X_tag_y = X_tag(2, :);
    
    % Formulas accoridngly to Lecture 4 notations - Bilinear approximation

    X_tag_x_E = ceil(X_tag_x);
    X_tag_x_W = floor(X_tag_x);

    X_tag_y_N = ceil(X_tag_y);
    X_tag_y_S = floor(X_tag_y);
    
    SE = im(sub2ind(size(im), X_tag_y_S, X_tag_x_E));
    SW = im(sub2ind(size(im), X_tag_y_S, X_tag_x_W));
    
    delta_x = X_tag_x - X_tag_x_W;
    S = SE .* delta_x + SW .* (1 - delta_x);

    NE = im(sub2ind(size(im), X_tag_y_N, X_tag_x_E));
    NW = im(sub2ind(size(im), X_tag_y_N, X_tag_x_W));
    
    N = NE .* delta_x + NW .* (1 - delta_x);

    delta_y = X_tag_y - X_tag_y_S;
    
    V = N .* delta_y + S .* (1 - delta_y);
    
    % Outside polygon pixels leave as they are, inside polygon pixels take from other squad
    newIm(sub2ind(size(newIm), Y(:), X(:))) = inpolygon_points(:) .* V' + ~inpolygon_points(:) .* newIm(sub2ind(size(newIm), Y(:), X(:)));
    
end
