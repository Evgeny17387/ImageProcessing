%% Init

clc;
clear;
close all;

N = 4;

%% a

image_type = 2;
% 1 - Elena
% 2 - Cups

switch (image_type)
    case 1
        img = round(double(imread("..\IMAGES\lena.tif")));
    case 2
        img = round(double(imread("..\IMAGES\cups.tif")));
end

[imgNbitUniform, ~] = uniformQuantization(img, N);

[imgNbitOptimal, ~] = optimalQuantization(img, N);

figure('WindowState', 'maximized');

subplot(1, 3, 1)
imagesc(img)
title('8 bit')
colormap('gray');
axis image;

subplot(1, 3, 2)
imagesc(imgNbitUniform)
title('N bit - Uniform')
colormap('gray');
axis image;

subplot(1, 3, 3)
imagesc(imgNbitOptimal)
title('N bit - Optimal')
colormap('gray');
axis image;

%% b









