function [h] = histImage(img)

    scale = 256;

    h = zeros(1, scale);

    for x = 0: scale - 1

        [~, ~, vals] = find(img == x);

        h(1, x + 1) = size(vals, 1);

    end

end
