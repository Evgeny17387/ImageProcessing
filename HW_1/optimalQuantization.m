function [imgNbit, Qvals] = optimalQuantization(img8bit, N)
% Description:
% This function performs optimal quantization using Loyd-Max algorithm
% Inputs:
% img8bit - 8 bit image (uint8)
% N - quantization bits of new image
% Outputs:
% imgNbit - new quntized image accoridngly to N bits
% Qvals - lookup table, from new values (N bits) to previous (8 bits)
% Author:
% Name - Evgeny Ostrovsky
% Email - evgeny17387@gmail.com

    epsilon = 1;

    % Orignla image color histogram
    histogram_8_bit = histImage(img8bit);

    % Initial guess
    z = round(linspace(0, 2 ^ 8 - 1, 2 ^ N + 1));
    % Smart initial guess for binarized images
    if N == 1
        denominator = sum(histogram_8_bit(z(1) + 1: z(3) + 1));
        numerator = sum(histogram_8_bit(z(1) + 1: z(3) + 1) .* [z(1): z(3)]);
        z(2) = round(numerator / denominator);
    end
    
    q = round((z(1: end - 1) + z(2: end)) / 2);

    dE_current = intmax('uint64');
    E_previous = intmax('uint64');
    
    while (dE_current > epsilon)

        % q
        for i = 1: 2 ^ N
            q_denominator = sum(histogram_8_bit(z(i) + 1: z(i + 1) + 1));
            q_numerator = sum(histogram_8_bit(z(i) + 1: z(i + 1) + 1) .* [z(i): z(i + 1)]);
            if q_numerator == 0
                q(i) = round((z(i) + z(i + 1)) / 2);
            else
                q(i) = round(q_numerator / q_denominator);
            end
        end
        
        % Z
        z(2: 2 ^ N) = round((q(1: end - 1) + q(2: end)) / 2);
        
        % Energy
        E_current = 0;
        for i = 1: 2 ^ N
            E_current = E_current + sum(histogram_8_bit(z(i) + 1: z(i + 1) + 1) .* (([z(i): z(i + 1)] - q(i)) .^ 2));
        end
        dE_current = abs(E_previous - E_current);
        E_previous = E_current;
        
    end
    
    % Return values
    Qvals = q;
    imgNbit = img8bit;
    for i = 1: 2 ^ N
        imgNbit((img8bit >= z(i)) & (img8bit <= z(i + 1))) = Qvals(i);
    end

end
