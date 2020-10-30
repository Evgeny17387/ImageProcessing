function [imgNbit, Qvals] = uniformQuantization(img8bit, N)

    imgNbit = floor(img8bit * 2 ^ (N - 8));

    Qvals = [0: 2 ^ (8 - N) : 2 ^ 8 - 1];

end
