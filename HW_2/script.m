% Restart Environment
clc;
clear;
close all;

% Remote Control

remote_control = 1;
% 0 - save quads
% 1 - load quads and play video

% Parameters

movieFileName = "magic_movie.avi";
numFrames = 100;
transformType = 0;

% Magic Movie flow

im = round(double(imread("Images\lena.tif")));

switch remote_control
    case 0
        [pointsSet_grab, pointsSet_0, pointsSet_1] = getUserInputs(im);
        save('quads.mat', 'pointsSet_grab', 'pointsSet_0', 'pointsSet_1');

    case 1
        load('quads.mat');
        createMagicMovie(movieFileName, numFrames, im, transformType, pointsSet_grab, pointsSet_0, pointsSet_1)

end
