% Restart Environment
clc;
clear;
close all;

% Parameters

movieFileName = "magic_movie.avi";
numFrames = 3;
transformType = 0;

% Load image

im = round(double(imread("Images\lena.tif")));

% Magic Movie flow

% [pointsSet_grab, pointsSet_0, pointsSet_1] = getUserInputs(im);
% save('quads.mat', 'pointsSet_grab', 'pointsSet_0', 'pointsSet_1');

load('quads.mat');
createMagicMovie(movieFileName, numFrames, im, transformType, pointsSet_grab, pointsSet_0, pointsSet_1)
