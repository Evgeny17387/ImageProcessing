% Restart Environment

clc;
clear;
close all;

% Remote Control



% Parameters

image_file_name = "lena.tif";
p = 0.1;
maskRadius = [1, 1];
maskSTD = 10;

% Init

im = round(double(imread("Images\" + image_file_name)));

% Debug Options

imagesc(im)
title(['1', newline, '2'], 'FontSize', 16)
