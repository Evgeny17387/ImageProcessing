function [pointsSet_grab, pointsSet_0, pointsSet_1] = getUserInputs(im)
% Description:
% Outputs xy coordinates of the 3 quads. The function allows the users to click in image to select the quads. Quads are visualized on the image
% Inputs:
% im - grayscale image in the range [0..255]
% Outputs:
% pointsSet_grab, pointsSet_0, pointsSet_1 – array 2XN of coordinates of the form [x1,x2,x3…; y1, y2, y3…] representing quads
% Author:
% Name - Evgeny Ostrovsky
% Email - evgeny17387@gmail.com
    
    % Plot the image
    imagesc(im);
    colormap('gray');
    axis image;
    set(gca,'xtick',[]);
    set(gca,'ytick',[]);

    % Get pointsSet_0 quad
    title('Select Start Quad', 'FontSize', 16, 'Color', 'cyan')
    pointsSet_0 = ginput(4);
    drawpolygon('Position', pointsSet_0, 'Color', 'cyan');
    pointsSet_0 = transpose(pointsSet_0);
    pointsSet_0(:, 5) = pointsSet_0(:, 1);

    % Get pointsSet_grab quad
    title('Select Grab Quad', 'FontSize', 16, 'Color', 'yellow')
    pointsSet_grab = ginput(4);
    drawpolygon('Position', pointsSet_grab, 'Color', 'yellow');
    pointsSet_grab = transpose(pointsSet_grab);
    pointsSet_grab(:, 5) = pointsSet_grab(:, 1);

    % Get pointsSet_1 quad
    title('Select End Quad', 'FontSize', 16, 'Color', 'magenta')
    pointsSet_1 = ginput(4);
    drawpolygon('Position', pointsSet_1, 'Color', 'magenta');
    pointsSet_1 = transpose(pointsSet_1);
    pointsSet_1(:, 5) = pointsSet_1(:, 1);

end
