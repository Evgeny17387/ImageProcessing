% Restart Environment

clc;
clear;
close all;

% Remote Control



% Parameters

image_file_name = "lena.tif";
s = 20;

% Init

im = round(double(imread("Images\" + image_file_name)));
[noisyIm] = addGaussianNoise(im, s);

% Debug Options

subplot(2, 2, 1)
imagesc(im)
subplot(2, 2, 2)
imagesc(noisyIm)
