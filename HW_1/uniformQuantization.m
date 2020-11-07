function [imgNbit, Qvals] = uniformQuantization(img8bit, N)
% Description:
% This function performs uniform quantization
% Inputs:
% img8bit - 8 bit image (uint8)
% N - quantization bits of new image
% Outputs:
% imgNbit - new quntized image accoridngly to N bits
% Qvals - lookup table, from new values (N bits) to previous (8 bits)
% Author:
% Name - Evgeny Ostrovsky
% Email - evgeny17387@gmail.com

    imgNbit = floor(img8bit * 2 ^ (N - 8));

    Qvals = [0: 2 ^ (8 - N) : 2 ^ 8 - 1];

end
