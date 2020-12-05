% Restart Environment
clc;
clear;
close all;

% Parameters

remote_control = 1;
% 0 - save quads
% 1 - load quads and play video

movieFileName = "magic_movie.avi";
numFrames = 100;
transformType = 0;

% Load image

im = round(double(imread("Images\lena.tif")));

% Magic Movie flow

switch remote_control
    case 0
        [pointsSet_grab, pointsSet_0, pointsSet_1] = getUserInputs(im);
        save('quads.mat', 'pointsSet_grab', 'pointsSet_0', 'pointsSet_1');
    case 1
        load('quads.mat');
        createMagicMovie(movieFileName, numFrames, im, transformType, pointsSet_grab, pointsSet_0, pointsSet_1)
end
