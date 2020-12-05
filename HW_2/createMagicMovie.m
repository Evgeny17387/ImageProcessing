function [] = createMagicMovie(movieFileName, numFrames, im, transformType, pointsSet_grab, pointsSet_0, pointsSet_1)
% Description:
% Creates the magic movie
% Inputs:
% movieFileName – string with name of output movie file name (example "myMovie.avi")
% numFrames – number of frames of output movie (must be even)
% im - grayscale image array in the range [0..255]
% transformType – a scalar. 0 = affine, 1 = projective
% pointsSet_grab, pointsSet_0, pointsSet_1 – array 2XN of coordinates of the form [x1,x2,x3…; y1, y2, y3…] representing quads
% Outputs:
% None
% Author:
% Name - Evgeny Ostrovsky
% Email - evgeny17387@gmail.com

    % Check if need to get quads from user
    switch nargin
        case 7
            % Do nothing, all inputs are o.k.

        case 4
            [pointsSet_grab, pointsSet_0, pointsSet_1] = getUserInputs(im);

        otherwise
            disp('Number of inputs Error, expected all or pointsSet_grab, pointsSet_0, pointsSet_1 can be ommited');
            return;
    end

    % Start video
    video = VideoWriter(movieFileName);
    open(video);
    
    % Plot originak image and wait for objects to be plotted
    imagesc(im);
    hold on;

    % Prepare trajectory for 
    for i = 1: 5

        pointsSet_0_pointsSet_grab_trajectory_x(:, i) = linspace(pointsSet_0(1, i), pointsSet_grab(1, i), numFrames);
        pointsSet_0_pointsSet_grab_trajectory_y(:, i) = linspace(pointsSet_0(2, i), pointsSet_grab(2, i), numFrames);

    end

    % Motion 1 - from pointsSet_0 to pointsSet_grab
    for i = 1: numFrames
        
        p = plot(pointsSet_0_pointsSet_grab_trajectory_x(i, :)', pointsSet_0_pointsSet_grab_trajectory_y(i, :)', 'Color', 'cyan', 'LineWidth', 2);
        
        frameT = getframe(gcf);
        writeVideo(video,frameT);

%         pause(1);

        delete(p);
        
    end

    % End video
     close(video);

end
