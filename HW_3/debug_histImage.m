function [h] = debug_histImage(img)
% Description:
% This function calculates histogram of an image
% Inputs:
% img - image
% Outputs:
% h - histogram of image values
% Author:
% Name - Evgeny Ostrovsky
% Email - evgeny17387@gmail.com

    scale = 256;

    h = zeros(1, scale);

    for x = 0: scale - 1

        [~, ~, vals] = find(img == x);

        h(1, x + 1) = size(vals, 1);

    end

end
