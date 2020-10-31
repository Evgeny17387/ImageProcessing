%% Init

clc;
clear;
close all;

%% a

image = round(double(imread("..\IMAGES\cups.tif")));

[imgNbitUniform, ~] = uniformQuantization(image, 4);

[imgNbitOptimal, ~] = optimalQuantization(image, 4);

figure('WindowState', 'maximized');

subplot(1, 3, 1)
imagesc(image)
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

pause

%% b

image = round(double(imread("..\IMAGES\ricefields.tif")));

[bimage] = binarize(image, 128);

[bimageOpt, T] = binarizeOpt(image);

figure('WindowState', 'maximized');

subplot(1, 3, 1)
imagesc(image)
title('8 bit')
colormap('gray');
axis image;

subplot(1, 3, 2)
imagesc(bimage)
title('1 bit')
colormap('gray');
axis image;

subplot(1, 3, 3)
imagesc(bimageOpt)
title('1 bit Optimized')
colormap('gray');
axis image;

pause
 
%% c



pause
