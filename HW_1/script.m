%% Section A

clc;
clear;
close all;

N = 4;

figure('WindowState', 'maximized');
set(gcf, 'Color', 'white');

image = round(double(imread("Images\cups.tif")));
subplot(1, 3, 1)
imagesc(image)
rectangle('Position', [10, 70, 80, 50], 'Curvature', [0.8, 0.4], 'EdgeColor', 'r', 'LineWidth', 2, 'LineStyle', '--')
rectangle('Position', [165, 60, 60, 50], 'Curvature', [0.8, 0.4], 'EdgeColor', 'r', 'LineWidth', 2, 'LineStyle', '--')
title(['Original - 8 bits'], 'FontSize', 16)
colormap('gray');
axis image;
set(gca,'xtick',[])
set(gca,'ytick',[])

[imgNbitUniform, ~] = uniformQuantization(image, N);
subplot(1, 3, 2)
imagesc(imgNbitUniform)
rectangle('Position', [10, 70, 80, 50], 'Curvature', [0.8, 0.4], 'EdgeColor', 'r', 'LineWidth', 2, 'LineStyle', '--')
rectangle('Position', [165, 60, 60, 50], 'Curvature', [0.8, 0.4], 'EdgeColor', 'r', 'LineWidth', 2, 'LineStyle', '--')
title(['Uniform Quantization - ',num2str(N), ' bits'], 'FontSize', 16)
colormap('gray');
axis image;
set(gca,'xtick',[])
set(gca,'ytick',[])

[imgNbitOptimal, ~] = optimalQuantization(image, N);
subplot(1, 3, 3)
imagesc(imgNbitOptimal)
rectangle('Position', [10, 70, 80, 50], 'Curvature', [0.8, 0.4], 'EdgeColor', 'r', 'LineWidth', 2, 'LineStyle', '--')
rectangle('Position', [165, 60, 60, 50], 'Curvature', [0.8, 0.4], 'EdgeColor', 'r', 'LineWidth', 2, 'LineStyle', '--')
title(['Optimal Quantization - ',num2str(N), ' bits'], 'FontSize', 16)
colormap('gray');
axis image;
set(gca,'xtick',[])
set(gca,'ytick',[])

section_a_text = [
    '\bf ', 'Section A: Uniform Quantization Vs. Optimal Qunatization', ' \rm', ...
    newline, ...
    'In the red squares, false contours can be seen for uniform quntization much worst than for optimal quantization', ...
    newline, ...
    'Please hit Enter key to continue to the next section'
];
sgtitle(section_a_text, 'Color', 'blue')
disp(section_a_text)

% pause

%% Section A - Extra






%% Section B

clc;
clear;
close all;

T = 128;

figure('WindowState', 'maximized');
set(gcf, 'Color', 'white');

image = round(double(imread("Images\ricefields.tif")));
subplot(1, 3, 1)
imagesc(image)
rectangle('Position', [25, 80, 60, 150], 'Curvature', [0.8, 0.4], 'EdgeColor', 'r', 'LineWidth', 4, 'LineStyle', '--')
title(['Original - 8 bits'], 'FontSize', 16)
colormap('gray');
axis image;
set(gca,'xtick',[])
set(gca,'ytick',[])

[bimage] = binarize(image, 128);
subplot(1, 3, 2)
imagesc(bimage)
rectangle('Position', [25, 80, 60, 150], 'Curvature', [0.8, 0.4], 'EdgeColor', 'r', 'LineWidth', 4, 'LineStyle', '--')
title(['Binarized Manually, Threshold = ', num2str(T)], 'FontSize', 16)
colormap('gray');
axis image;
set(gca,'xtick',[])
set(gca,'ytick',[])

[bimageOpt, T] = binarizeOpt(image);
subplot(1, 3, 3)
imagesc(bimageOpt)
rectangle('Position', [25, 80, 60, 150], 'Curvature', [0.8, 0.4], 'EdgeColor', 'r', 'LineWidth', 4, 'LineStyle', '--')
title(['Binarized Optimal, Threshold = ', num2str(T)], 'FontSize', 16)
colormap('gray');
axis image;
set(gca,'xtick',[])
set(gca,'ytick',[])

section_b_text = [
    '\bf ', 'Section B: Manual Binarization Vs. Optimal Binarization', ' \rm', ...
    newline, ...
    'In the red squares, for the manual binarization the person is hard to see, but in the optimized he can be easily distinguished', ...
    newline, ...
    'Please hit Enter key to continue to the next section'
];
sgtitle(section_b_text, 'Color', 'blue')
disp(section_b_text)

% pause

%% Section C

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
