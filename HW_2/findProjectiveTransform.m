function [T] = findProjectiveTransform(pointsSet1, pointsSet2)
% Description:
% This routine calculates the Affine transform that maps points in set1 to corresponding points in set2, optimally in the least mean square sense
% Inputs:
% pointsSet1, pointsSet2 – array 2XN of coordinates of the form [x1,x2,x3…; y1, y2, y3…] representing quads
% Outputs:
% T - projective transformation matrix
% Author:
% Name - Evgeny Ostrovsky
% Email - evgeny17387@gmail.com

    % Prepare X_tag and X matrices
    X_tag = zeros(8, 1);
    for i = 1: 4
        X_tag(2 * i - 1, 1) = pointsSet2(1, i);
        X_tag(2 * i, 1) = pointsSet2(2, i);
    end
    
    X = zeros(8, 8);
    for i = 1: 4
        X(2 * i - 1, :) = [pointsSet1(1, i), pointsSet1(2, i), 0, 0, 1, 0, -1 * pointsSet1(1, i) * pointsSet2(1, i), -1 * pointsSet1(2, i) * pointsSet2(1, i)];
        X(2 * i, :) = [0, 0, pointsSet1(1, i), pointsSet1(2, i), 0, 1, -1 * pointsSet1(1, i) * pointsSet2(2, i), -1 * pointsSet1(2, i) * pointsSet2(2, i)];
    end

    % Calculate AX=X_tag Accordingly to LMS solution for A
    A = pinv(X) * X_tag;

    % Back to transformation matrix
    T = [A(1, 1), A(2, 1), A(5, 1); A(3, 1), A(4, 1), A(6, 1); A(7, 1), A(8, 1), 1];

end
