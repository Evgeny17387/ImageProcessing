% Restart Environment
clc;
clear;
close all;

% Remote Control

remote_control = 1; % 0 - save quads, 1 - load quads and play video
transformType = 0;

% Parameters

movieFileName = "myMovie.avi";
variablesFileName = "allPointsSets.mat";
numFrames = 200;

% Magic Movie flow

im = round(double(imread("movieImage.tif")));

switch remote_control
    case 0
        [pointsSet_grab, pointsSet_0, pointsSet_1] = getUserInputs(im);
        save(variablesFileName, 'pointsSet_grab', 'pointsSet_0', 'pointsSet_1');

    case 1
        load(variablesFileName);
        createMagicMovie(movieFileName, numFrames, im, transformType, pointsSet_grab, pointsSet_0, pointsSet_1)

end
