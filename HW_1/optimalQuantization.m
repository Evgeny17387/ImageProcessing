function [imgNbit, Qvals, E] = optimalQuantization(img8bit, N)

    epsilon = 2000;

    % Orignla image color histogram
    histogram_8_bit = histImage(img8bit);
    
    histogram_8_bit = histogram_8_bit + 1;

    % Initial guess
    z = floor(linspace(0, 2 ^ 8 - 1, 2 ^ N + 1));
    q = floor((z(1: end - 1) + z(2: end)) / 2);
    
    dE = intmax('uint64');
    E_previous = dE;

    E = [];
    
    while (dE > epsilon)
        
        % q
        for i = 1: 2 ^ N
            q_denominator = sum(histogram_8_bit(z(i) + 1: z(i + 1) + 1));
            q_numerator = sum(histogram_8_bit(z(i) + 1: z(i + 1) + 1) .* [z(i): z(i + 1)]);
            q(i) = floor(q_numerator / q_denominator);
        end

        % Z
        z(2: 2 ^ N) = floor((q(1: end - 1) + q(2: end)) / 2);
        
        % Energy
        E_current = 0;
        for i = 1: 2 ^ N
            E_current = E_current + sum(histogram_8_bit(z(i) + 1: z(i + 1) + 1) .* (([z(i): z(i + 1)] - q(i)) .^ 2));
        end
        E(end + 1) = E_current;
        dE = abs(E_previous - E_current)
        E_previous = E_current;

    end
    
    imgNbit = 0;
    Qvals = q;
    
end
