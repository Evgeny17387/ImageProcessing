%% 0

clc;
clear;
close all;

N = 4;

mu = 127;
sigma = 5;

size = 256;

img = reshape(floor(normrnd(mu, sigma, [1, size * size])), size, size);

%% 1

image_histogram = histImage(img);

x_axis = (0: 2 ^ 8 - 1);

figure('WindowState', 'maximized');
scatter(x_axis, image_histogram);

%% 2

[imgNbit, Qvals] = uniformQuantization(img, N);

plot(Qvals)

%% 3

[imgNbit, Qvals, E] = optimalQuantization(img, N);

figure('WindowState', 'maximized');

subplot(1, 2, 1)
plot(Qvals)
grid on
title("Qvals")

subplot(1, 2, 2)
plot(E)
grid on
title("E")
