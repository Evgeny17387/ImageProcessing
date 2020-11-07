%% A

clc;
clear;
close all;

image = round(double(imread("Images\cups.tif")));

N = 4;

[imgNbitUniform, ~] = uniformQuantization(image, N);
[imgNbitOptimal, ~] = optimalQuantization(image, N);

figure('WindowState', 'maximized');
set(gcf, 'Color', 'white');

subplot(1, 3, 1)
imagesc(image)
rectangle('Position', [10, 70, 80, 50], 'Curvature', [0.8, 0.4], 'EdgeColor', 'r', 'LineWidth', 2, 'LineStyle', '--')
rectangle('Position', [165, 60, 60, 50], 'Curvature', [0.8, 0.4], 'EdgeColor', 'r', 'LineWidth', 2, 'LineStyle', '--')
title(['Bits: ', num2str(8),' - Original'])
colormap('gray');
axis image;

subplot(1, 3, 2)
imagesc(imgNbitUniform)
rectangle('Position', [10, 70, 80, 50], 'Curvature', [0.8, 0.4], 'EdgeColor', 'r', 'LineWidth', 2, 'LineStyle', '--')
rectangle('Position', [165, 60, 60, 50], 'Curvature', [0.8, 0.4], 'EdgeColor', 'r', 'LineWidth', 2, 'LineStyle', '--')
title(['Bits: ', num2str(N),' - Uniform'])
colormap('gray');
axis image;

subplot(1, 3, 3)
imagesc(imgNbitOptimal)
rectangle('Position', [10, 70, 80, 50], 'Curvature', [0.8, 0.4], 'EdgeColor', 'r', 'LineWidth', 2, 'LineStyle', '--')
rectangle('Position', [165, 60, 60, 50], 'Curvature', [0.8, 0.4], 'EdgeColor', 'r', 'LineWidth', 2, 'LineStyle', '--')
title(['Bits: ', num2str(N),' - Optimal'])
colormap('gray');
axis image;

section_text = [
    '\bf ', 'Section A: Uniform Quantization Vs. Optimal Qunatization', ' \rm', ...
    newline, ...
    'Optimal Qunatization is using', ' \bf ', 'Loyd-Max', ' \rm ', 'Algorithm for Optimal Quantization', ...
    newline, ...
    'In the red squares, false contours can be seen for uniform quntization much worst than for optimal quantization', ...
    newline, ...
    'Please hit Enter key to continue to the next section'
];
sgtitle(section_text, 'Color', 'blue')
disp(section_text)

% pause

%% B

clc;
clear;
close all;

image = round(double(imread("Images\ricefields.tif")));

[bimage] = binarize(image, 128);

[bimageOpt, T] = binarizeOpt(image);

figure('WindowState', 'maximized');

subplot(1, 3, 1)
imagesc(image)
title('8 bit')
colormap('gray');
axis image;

subplot(1, 3, 2)
imagesc(bimage)
title('1 bit')
colormap('gray');
axis image;

subplot(1, 3, 3)
imagesc(bimageOpt)
title('1 bit Optimized')
colormap('gray');
axis image;

% pause
 
%% C

clc;
clear;
close all;







% pause
