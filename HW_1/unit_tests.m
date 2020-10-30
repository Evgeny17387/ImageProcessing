%% Reset Views

clc;
clear;
close all;

show_compare_images = true;
show_simulation = false;
show_iteration_energy = false;
iterations = 0;

image_type = 2;
% 0 - Artificial
% 1 - Elena
% 2 - Cups

N = 4;

epsilon = 1;

switch (image_type)
    case 0
        mu = 127;
        sigma = 5;
        size = 256;
        img = reshape(floor(normrnd(mu, sigma, [1, size * size])), size, size);
    case 1
        img = round(double(imread("..\IMAGES\lena.tif")));
    case 2
        img = round(double(imread("..\IMAGES\cups.tif")));
end

%% 1

image_histogram = histImage(img);

x_axis = (0: 2 ^ 8 - 1);

figure('WindowState', 'maximized');
scatter(x_axis, image_histogram);

%% 2

[imgNbit, Qvals] = uniformQuantization(img, N);

figure('WindowState', 'maximized');

subplot(1, 2, 1)
imagesc(img)
colormap('gray');

subplot(1, 2, 2)
imagesc(imgNbit)
colormap('gray');

%% 3

[imgNbit, Qvals, E, dE] = optimalQuantizationDebugAble(img, N, epsilon, show_simulation, iterations);

if show_iteration_energy

    figure('WindowState', 'maximized');

    subplot(1, 3, 1)
    plot(Qvals)
    grid on
    title("Qvals")

    subplot(1, 3, 2)
    plot(E)
    grid on
    title("E")

    subplot(1, 3, 3)
    plot(dE(2:end))
    grid on
    title("dE")

end

if show_compare_images

    figure('WindowState', 'maximized');

    subplot(1, 2, 1)
    imagesc(img)
    title('8 bit')
    colormap('gray');
    axis image;

    subplot(1, 2, 2)
    imagesc(imgNbit)
    title('N bit - Optimal')
    colormap('gray');
    axis image;

end
