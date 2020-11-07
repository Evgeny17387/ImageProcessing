
clc;
clear;
close all;

winsize = 50;

figure('WindowState', 'maximized');
set(gcf, 'Color', 'white');

image = round(double(imread("Images\text.tif")));
image = round(double(image(:,:,2))); 
subplot(1, 3, 1)
imagesc(image)
colormap('gray');
axis image;

[bimageOpt, T] = binarizeOpt(image);
subplot(1, 3, 2)
imagesc(bimageOpt)
colormap('gray');
axis image;

[bimageAdaptive] = binarizeOptAdaptive(image, winsize);
subplot(1, 3, 3)
imagesc(bimageAdaptive)
colormap('gray');
axis image;
