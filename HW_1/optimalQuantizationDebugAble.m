function [imgNbit, Qvals, E, dE] = optimalQuantizationDebugAble(img8bit, N, epsilon, show_simulation, iterations)

    % Orignla image color histogram
    histogram_8_bit = histImage(img8bit);

    if show_simulation
        figure('WindowState', 'maximized');
    end

    histogram_8_bit = histogram_8_bit + 1;

    % Initial guess
    z = round(linspace(0, 2 ^ 8 - 1, 2 ^ N + 1));
    q = round((z(1: end - 1) + z(2: end)) / 2);

    E = [];
    dE = [];

    dE_current = intmax('uint64');
    E_previous = intmax('uint64');
    
    iteration = 0;
    
    while (check_stop_condition(iterations, iteration, dE_current, epsilon))
        
        % Histogram
        if show_simulation
            hold off
            plot(histogram_8_bit)
            hold on
        end

        % q
        for i = 1: 2 ^ N
            q_denominator = sum(histogram_8_bit(z(i) + 1: z(i + 1) + 1));
            q_numerator = sum(histogram_8_bit(z(i) + 1: z(i + 1) + 1) .* [z(i): z(i + 1)]);
            q(i) = round(q_numerator / q_denominator);
        end
        if show_simulation
            scatter(q, zeros([1, length(q)]), 'o', 'blue');
        end
        
        % Z
        z(2: 2 ^ N) = round((q(1: end - 1) + q(2: end)) / 2);
        if show_simulation
            scatter(z, zeros([1, length(z)]), '+', 'red');
        end
        
        % Energy
        E_current = 0;
        for i = 1: 2 ^ N
            E_current = E_current + sum(histogram_8_bit(z(i) + 1: z(i + 1) + 1) .* (([z(i): z(i + 1)] - q(i)) .^ 2));
        end
        E(end + 1) = E_current;
        dE_current = abs(E_previous - E_current);
        dE(end + 1) = dE_current;
        E_previous = E_current;

        if show_simulation
            pause;
        end

        iteration = iteration + 1
        
    end
    
    Qvals = q;
    imgNbit = img8bit;
    for i = 1: 2 ^ N
        imgNbit((img8bit >= z(i)) & (img8bit <= z(i + 1))) = Qvals(i);
    end

    function condition = check_stop_condition(iterations, iteration, dE_current, epsilon)
        if (iterations ~= 0)
            condition = iteration < iterations;
        else
            condition = dE_current > epsilon;
        end
    end

end
