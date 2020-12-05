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
    
    % Complete points to have line that connect last and first points
    pointsSet_0(:, 5) = pointsSet_0(:, 1);
    pointsSet_grab(:, 5) = pointsSet_grab(:, 1);
    pointsSet_1(:, 5) = pointsSet_1(:, 1);

    % Start video
    video = VideoWriter(movieFileName);
    open(video);
    
    % Plot originak image and wait for objects to be plotted
    imagesc(im);
    colormap('gray');
    axis image;
    set(gca,'xtick',[]);
    set(gca,'ytick',[]);
    hold on;
    
    numFramesEachDirection = round(numFrames / 2);

    pointsSet_0_pointsSet_grab_trajectory_x = zeros(5, numFramesEachDirection);
    pointsSet_0_pointsSet_grab_trajectory_y = zeros(5, numFramesEachDirection);
    pointsSet_grab_pointsSet_1_trajectory_x = zeros(5, numFramesEachDirection);
    pointsSet_grab_pointsSet_1_trajectory_y = zeros(5, numFramesEachDirection);
    % Prepare trajectory for both ways
    for i = 1: 5
        pointsSet_0_pointsSet_grab_trajectory_x(i, :) = linspace(pointsSet_0(1, i), pointsSet_grab(1, i), numFramesEachDirection);
        pointsSet_0_pointsSet_grab_trajectory_y(i, :) = linspace(pointsSet_0(2, i), pointsSet_grab(2, i), numFramesEachDirection);

        pointsSet_grab_pointsSet_1_trajectory_x(i, :) = linspace(pointsSet_grab(1, i), pointsSet_1(1, i), numFramesEachDirection);
        pointsSet_grab_pointsSet_1_trajectory_y(i, :) = linspace(pointsSet_grab(2, i), pointsSet_1(2, i), numFramesEachDirection);
    end

    % Motion 1 - from pointsSet_0 to pointsSet_grab
    for i = 1: numFramesEachDirection
        
        p = plot(pointsSet_0_pointsSet_grab_trajectory_x(:, i)', pointsSet_0_pointsSet_grab_trajectory_y(:, i)', 'Color', 'cyan', 'LineWidth', 2);
        
        frameT = getframe(gcf);
        writeVideo(video,frameT);

        delete(p);
        
    end

    % Motion 2 - from pointsSet_grab to pointsSet_1
    for i = 1: numFramesEachDirection

        pointsSet2 = [pointsSet_grab_pointsSet_1_trajectory_x(:, i)'; pointsSet_grab_pointsSet_1_trajectory_y(:, i)'];
        
        newIm = mapQuad(im, pointsSet_grab, pointsSet2, transformType);

        imagesc(newIm);
        p = plot(pointsSet_grab_pointsSet_1_trajectory_x(:, i)', pointsSet_grab_pointsSet_1_trajectory_y(:, i)', 'Color', 'cyan', 'LineWidth', 2);

        frameT = getframe(gcf);
        writeVideo(video,frameT);

        delete(p);
        
    end
    
    % Since last image will have no frame
    p = plot(pointsSet_grab_pointsSet_1_trajectory_x(:, i)', pointsSet_grab_pointsSet_1_trajectory_y(:, i)', 'Color', 'cyan', 'LineWidth', 2);

    % End video
    close(video);

end
