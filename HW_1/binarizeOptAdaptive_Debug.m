function [bimg] = binarizeOptAdaptive(im, winsize)

    show_simulation = false;
    epsilon = 1;
    iterations = 0;
    index = 0;
    index_to_debug = 0;
    jump = 1;
%     jump = winsize;
    
    bimg = im;

    for i = 1 : jump : size(im, 1) - winsize + 1
        
        for j = 1 : jump : size(im, 2) - winsize + 1
            
            index = index + 1;
            
            if index == index_to_debug
                show_simulation = true;
            else
                show_simulation = false;
            end
            
            if show_simulation
                close all;
            end

%             [~, Qvals] = optimalQuantization(im(i: i + winsize - 1, j: j + winsize - 1), 1);
            [~, Qvals, ~, ~] = optimalQuantizationDebugAble(im(i: i + winsize - 1, j: j + winsize - 1), 1, epsilon, show_simulation, iterations);

            T = (Qvals(1) + Qvals(2)) / 2;
            
            bimg(i + round(winsize / 2), j + round(winsize / 2)) = binarize(im(i + round(winsize / 2), j + round(winsize / 2)), T);

        end
        
    end
    
end
