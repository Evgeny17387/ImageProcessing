function [imgNbit, Qvals] = optimalQuantization(img8bit, N)

    epsilon = 1;

    % Orignla image color histogram
    histogram_8_bit = histImage(img8bit);
    % Patch, in order to avoid division by 0 in q
    histogram_8_bit = histogram_8_bit + 1;

    % Initial guess
    z = round(linspace(0, 2 ^ 8 - 1, 2 ^ N + 1));
    q = round((z(1: end - 1) + z(2: end)) / 2);

    dE_current = intmax('uint64');
    E_previous = intmax('uint64');
    
    while (dE_current > epsilon)

        % q
        for i = 1: 2 ^ N
            q_denominator = sum(histogram_8_bit(z(i) + 1: z(i + 1) + 1));
            q_numerator = sum(histogram_8_bit(z(i) + 1: z(i + 1) + 1) .* [z(i): z(i + 1)]);
            q(i) = round(q_numerator / q_denominator);
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
