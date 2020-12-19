%% Section J

clc;
clear;
close all;

imageFileName = "lena.tif";
im = round(double(imread("Images\" + imageFileName)));

figure('WindowState', 'maximized');
set(gcf, 'Color', 'white');

subplot(1, 3, 1);
imagesc(im);
title('Original');
colormap('gray');
axis image;
set(gca,'xtick',[]);
set(gca,'ytick',[]);

k = 5;
blurKernel = ones(k, k) ./ k ^ 2;
blurIm = conv2(im, blurKernel, "Same");
subplot(1, 3, 2);
imagesc(blurIm);
title(['Blur', 'k: ' + string(k)]);
colormap('gray');
axis image;
set(gca,'xtick',[]);
set(gca,'ytick',[]);

maskRadius = [2, 2];
maskSTD = 10;
lambda = 1;
[sharpIm] = sharpen(blurIm, maskRadius, maskSTD, lambda);
subplot(1, 3, 3);
imagesc(sharpIm);
title('Sharpen', 'Lambda: ' + string(lambda));
colormap('gray');
axis image;
set(gca,'xtick',[]);
set(gca,'ytick',[]);
