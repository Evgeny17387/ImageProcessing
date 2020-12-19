%% Section A

clc;
clear;
close all;

imageFileName = "lena.tif";
p = 0.1;
maskRadius = [1, 1];
maskSTD = 10;

im = round(double(imread("Images\" + imageFileName)));

[noisyIm] = addSPnoise(im, p);
[cleanImMedian] = cleanImageMedian(noisyIm, maskRadius);
[cleanImMean] = cleanImageMean(noisyIm, maskRadius, maskSTD);

figure('WindowState', 'maximized');
set(gcf, 'Color', 'white');

subplot(1, 4, 1)
imagesc(im)
title(['Original'], 'FontSize', 16)
colormap('gray');
axis image;
set(gca,'xtick',[])
set(gca,'ytick',[])

subplot(1, 4, 2)
imagesc(noisyIm)
title(['With SP Noise', 'PSNR: ' + string(calcPSNR(noisyIm, im))], 'FontSize', 16)
colormap('gray');
axis image;
set(gca,'xtick',[])
set(gca,'ytick',[])

subplot(1, 4, 3)
imagesc(cleanImMean)
title(['Mean Filter', 'PSNR: ' + string(calcPSNR(cleanImMean, im))], 'FontSize', 16)
colormap('gray');
axis image;
set(gca,'xtick',[])
set(gca,'ytick',[])

subplot(1, 4, 4)
imagesc(cleanImMedian)
title(['Median Filter', 'PSNR: ' + string(calcPSNR(cleanImMedian, im))], 'FontSize', 16)
colormap('gray');
axis image;
set(gca,'xtick',[])
set(gca,'ytick',[])

section_a_text = [
    '\bf ', 'Section A: SP Noise, Median Vs. Average Filters', ' \rm', ...
    newline, ...
    'As can be seen, Median filter cleanes the noise better than Average, which is expected', ...
    newline, ...
    'Also, the PNSR is higher for median, which indicates the same', ...
    newline, ...
    newline, ...
    newline, ...
    'Please hit Enter key to continue to the next section'
];
sgtitle(section_a_text, 'Color', 'blue')
disp(section_a_text)

pause

%% Section B

clc;
clear;
close all;

imageFileName = "lena.tif";
s = 20;
maskRadius = [1, 1];
maskSTD = 3;

im = round(double(imread("Images\" + imageFileName)));

[noisyIm] = addGaussianNoise(im, s);
[cleanImMedian] = cleanImageMedian(noisyIm, maskRadius);
[cleanImMean] = cleanImageMean(noisyIm, maskRadius, maskSTD);

figure('WindowState', 'maximized');
set(gcf, 'Color', 'white');

subplot(1, 4, 1)
imagesc(im)
title(['Original'], 'FontSize', 16)
colormap('gray');
axis image;
set(gca,'xtick',[])
set(gca,'ytick',[])

subplot(1, 4, 2)
imagesc(noisyIm)
title(['With Gaussian Noise', 'PSNR: ' + string(calcPSNR(noisyIm, im))], 'FontSize', 16)
colormap('gray');
axis image;
set(gca,'xtick',[])
set(gca,'ytick',[])

subplot(1, 4, 3)
imagesc(cleanImMean)
title(['Mean Filter', 'PSNR: ' + string(calcPSNR(cleanImMean, im))], 'FontSize', 16)
colormap('gray');
axis image;
set(gca,'xtick',[])
set(gca,'ytick',[])

subplot(1, 4, 4)
imagesc(cleanImMedian)
title(['Median Filter', 'PSNR: ' + string(calcPSNR(cleanImMedian, im))], 'FontSize', 16)
colormap('gray');
axis image;
set(gca,'xtick',[])
set(gca,'ytick',[])

section_b_text = [
    '\bf ', 'Section B: Gaussian Noise, Median Vs. Average Filters', ' \rm', ...
    newline, ...
    'As can be seen, Mean filter works better', ...
    newline, ...
    'Altough, the PNSR is slighly higher for median', ...
    newline, ...
    newline, ...
    newline, ...
    'Please hit Enter key to continue to the next section'
];
sgtitle(section_b_text, 'Color', 'blue')
disp(section_b_text)

pause

%% Section C

clc;
clear;
close all;

section_c_text = [
    '\bf ', 'Section A: SP Noise, Median Vs. Average Filters', ' \rm', ...
    newline, ...
    'As can be seen, Median filter cleanes the noise better than Average, which is expected', ...
    newline, ...
    'Also, the PNSR is higher for median, which indicates the same', ...
    newline, ...
    '\bf ', 'Section B: Gaussian Noise, Median Vs. Average Filters', ' \rm', ...
    newline, ...
    'This time it is hard to tell which filter is better, altough we would expect Meam filter to clean better', ...
    newline, ...
    'Also, the PNSR is very similar', ...
    newline, ...
    newline, ...
    newline, ...
    'Please hit Enter key to continue to the next section'
];
figure('WindowState', 'maximized');
set(gcf, 'Color', 'white');
sgtitle(section_c_text, 'Color', 'blue')
disp(section_c_text)

%% Section D

clc;
clear;
close all;

imageFileName = "lena.tif";
p = 0.1;

im = round(double(imread("Images\" + imageFileName)));

[noisyIm] = addSPnoise(im, p);

psnrArray = zeros(1, 10);

figure('WindowState', 'maximized');
set(gcf, 'Color', 'white');

subplot(1, 4, 1)
imagesc(im)
title(['Original'], 'FontSize', 16)
colormap('gray');
axis image;
set(gca,'xtick',[])
set(gca,'ytick',[])

subplot(1, 4, 2)
imagesc(noisyIm)
title(['With SP Noise', 'PSNR: ' + string(calcPSNR(noisyIm, im))], 'FontSize', 16)
colormap('gray');
axis image;
set(gca,'xtick',[]);
set(gca,'ytick',[]);

radiusIndex = 0;
for radius = 1 : 10

    radiusIndex = radiusIndex + 1;
    maskRadius = [radius, radius];
    [cleanIm] = cleanImageMedian(noisyIm, maskRadius);
    psnrArray(radiusIndex) = calcPSNR(cleanIm, im);

    subplot(1, 4, 3)
    imagesc(cleanIm);
    title(['Median Filter', 'Radisu: ' + string(radius), 'PSNR: ' + string(psnrArray(radiusIndex))], 'FontSize', 16)
    colormap('gray');
    axis image;
    set(gca,'xtick',[]);
    set(gca,'ytick',[]);

    subplot(1, 4, 4);
    plot(psnrArray(1: radiusIndex));
    title(['PSNR Vs. Radius'], 'FontSize', 16);
    xlabel('Radius');
    ylabel('PSNR');

    section_d_text = [
        '\bf ', 'Section D: SP Noise, PSNR as Function of Median Filter Radius', ' \rm', ...
        newline, ...
        'Radius loop is 1 to 10', ...
        newline, ...
        newline, ...
        newline, ...
        'Please wait untill simulations ends'
    ];

    sgtitle(section_d_text, 'Color', 'blue')
    disp(section_d_text)
    
    pause(2);

end

section_d_text = [
    '\bf ', 'Section D: SP Noise, PSNR as Function of Median Filter Radius', ' \rm', ...
    newline, ...
    'As can be seen, the PSNR and the image quality degrades as the radius increases', ...
    newline, ...
    'Which is expected since we take more neighbors thus "ruining" the image local quality', ...
    newline, ...
    newline, ...
    newline, ...
    'Please hit Enter key to continue to the next section'
];

sgtitle(section_d_text, 'Color', 'blue')
disp(section_d_text)

pause

%% Section E

clc;
clear;
close all;

imageFileName = "lena.tif";
s = 20;

im = round(double(imread("Images\" + imageFileName)));

[noisyIm] = addGaussianNoise(im, s);

psnrArray = zeros(1, 10);
maskRadius = [5, 5];

figure('WindowState', 'maximized');
set(gcf, 'Color', 'white');

subplot(1, 4, 1)
imagesc(im)
title(['Original'], 'FontSize', 16)
colormap('gray');
axis image;
set(gca,'xtick',[])
set(gca,'ytick',[])

subplot(1, 4, 2)
imagesc(noisyIm)
title(['With Gaussian Noise', 'PSNR: ' + string(calcPSNR(noisyIm, im))], 'FontSize', 16)
colormap('gray');
axis image;
set(gca,'xtick',[]);
set(gca,'ytick',[]);

maskStdIndex = 0;
for maskStd = 1 : 10

    maskStdIndex = maskStdIndex + 1;
    [cleanIm] = cleanImageMean(noisyIm, maskRadius, maskStd);
    psnrArray(maskStdIndex) = calcPSNR(cleanIm, im);

    subplot(1, 4, 3)
    imagesc(cleanIm)
    title(['Mean Filter', 'MaskSTD: ' + string(maskStd), 'PSNR: ' + string(psnrArray(maskStdIndex))], 'FontSize', 16)
    colormap('gray');
    axis image;
    set(gca,'xtick',[]);
    set(gca,'ytick',[]);

    subplot(1, 4, 4);
    plot(psnrArray(1: maskStdIndex));
    title(['PSNR Vs. MaskSTD'], 'FontSize', 16);
    xlabel('MaskSTD');
    ylabel('PSNR');

    section_e_text = [
        '\bf ', 'Section E: Gaussian Noise, PSNR as Function of Mean Filter MaskSTD', ' \rm', ...
        newline, ...
        'MaskSTD loop is 1 to 10', ...
        newline, ...
        newline, ...
        newline, ...
        'Please wait untill simulations ends'
    ];

    sgtitle(section_e_text, 'Color', 'blue')
    disp(section_e_text)
    
    pause(2);

end

section_e_text = [
    '\bf ', 'Section E: Gaussian Noise, PSNR as Function of Mean Filter MaskSTD', ' \rm', ...
    newline, ...
    'As can be seen, the PSNR and the image quality degrades as the maskSTD increases', ...
    newline, ...
    'Which is expected since we take more neighbors thus "ruining" the image local quality of each pixel', ...
    newline, ...
    newline, ...
    newline, ...
    'Please hit Enter key to continue to the next section'
];

sgtitle(section_e_text, 'Color', 'blue')
disp(section_e_text)

pause

%% Section F

clc;
clear;
close all;

imageFileName = "lena.tif";
im = round(double(imread("Images\" + imageFileName)));

s = 30;

images = 10;
imArray = zeros(images, size(im, 1), size(im, 2));

for noisyImIndex = 1 : images
    [imArray(noisyImIndex, :, :)] = addGaussianNoise(im, s);
end

[cleanImMedian] = cleanImageMedian_multi(imArray);
[cleanImMean] = cleanImageMean_multi(imArray);

figure('WindowState', 'maximized');
set(gcf, 'Color', 'white');

subplot(1, 4, 1);
imagesc(im);
title(['Original'], 'FontSize', 16);
colormap('gray');
axis image;
set(gca,'xtick',[]);
set(gca,'ytick',[]);

subplot(1, 4, 2);
imagesc(squeeze(imArray(1, :, :)));
title(['With Gaussian Noise - First Image', 'PSNR: ' + string(calcPSNR(squeeze(imArray(1, :, :)), im))], 'FontSize', 16);
colormap('gray');
axis image;
set(gca,'xtick',[]);
set(gca,'ytick',[]);

subplot(1, 4, 3);
imagesc(cleanImMedian);
title(['Median', 'PSNR: ' + string(calcPSNR(cleanImMedian, im))], 'FontSize', 16);
colormap('gray');
axis image;
set(gca,'xtick',[]);
set(gca,'ytick',[]);

subplot(1, 4, 4);
imagesc(cleanImMean);
title(['Mean', 'PSNR: ' + string(calcPSNR(cleanImMean, im))], 'FontSize', 16);
colormap('gray');
axis image;
set(gca,'xtick',[]);
set(gca,'ytick',[]);

section_f_text = [
    '\bf ', 'Section F: Multiple Images, Gaussian Noise, Median Vs. Mean Filter', ' \rm', ...
    newline, ...
    'As can be seen, Mean filter works slightly better for Gaussian Noise', ...
    newline, ...
    newline, ...
    newline, ...
    'Please hit Enter key to continue to the next section'
];

sgtitle(section_f_text, 'Color', 'blue')
disp(section_f_text)

pause

%% Section G

clc;
clear;
close all;

imageFileName = "lena.tif";
im = round(double(imread("Images\" + imageFileName)));

p = 0.2;

images = 10;
imArray = zeros(images, size(im, 1), size(im, 2));

for noisyImIndex = 1 : images
    [imArray(noisyImIndex, :, :)] = addSPnoise(im, p);
end

[cleanImMedian] = cleanImageMedian_multi(imArray);
[cleanImMean] = cleanImageMean_multi(imArray);

figure('WindowState', 'maximized');
set(gcf, 'Color', 'white');

subplot(1, 4, 1);
imagesc(im);
title(['Original'], 'FontSize', 16);
colormap('gray');
axis image;
set(gca,'xtick',[]);
set(gca,'ytick',[]);

subplot(1, 4, 2);
imagesc(squeeze(imArray(1, :, :)));
title(['With SP Noise - First Image', 'PSNR: ' + string(calcPSNR(squeeze(imArray(1, :, :)), im))], 'FontSize', 16);
colormap('gray');
axis image;
set(gca,'xtick',[]);
set(gca,'ytick',[]);

subplot(1, 4, 3);
imagesc(cleanImMedian);
title(['Median', 'PSNR: ' + string(calcPSNR(cleanImMedian, im))], 'FontSize', 16);
colormap('gray');
axis image;
set(gca,'xtick',[]);
set(gca,'ytick',[]);

subplot(1, 4, 4);
imagesc(cleanImMean);
title(['Mean', 'PSNR: ' + string(calcPSNR(cleanImMean, im))], 'FontSize', 16);
colormap('gray');
axis image;
set(gca,'xtick',[]);
set(gca,'ytick',[]);

section_g_text = [
    '\bf ', 'Section G: Multiple Images, SP Noise, Median Vs. Mean Filter', ' \rm', ...
    newline, ...
    'As can be seen, Median filter works significantly better for SP Noise', ...
    newline, ...
    newline, ...
    newline, ...
    'Please hit Enter key to continue to the next section'
];

sgtitle(section_g_text, 'Color', 'blue')
disp(section_g_text)

pause

%% Section H

clc;
clear;
close all;

imageFileName = "lena.tif";
im = round(double(imread("Images\" + imageFileName)));

s = 30;

images = 10;
imArray = zeros(images, size(im, 1), size(im, 2));
psnrArray = zeros(images);

figure('WindowState', 'maximized');
set(gcf, 'Color', 'white');

subplot(1, 3, 1);
imagesc(im);
title(['Original'], 'FontSize', 16);
colormap('gray');
axis image;
set(gca,'xtick',[]);
set(gca,'ytick',[]);

for noisyImIndex = 1 : images

    [imArray(noisyImIndex, :, :)] = addGaussianNoise(im, s);
    [cleanIm] = cleanImageMedian_multi(imArray(1:noisyImIndex, :, :));
    psnrArray(noisyImIndex) = calcPSNR(cleanIm, im);

    subplot(1, 3, 2);
    imagesc(cleanIm);
    title(['Median', '# Images: ' + string(noisyImIndex), 'PSNR: ' + string(psnrArray(noisyImIndex))], 'FontSize', 16);
    colormap('gray');
    axis image;
    set(gca,'xtick',[]);
    set(gca,'ytick',[]);

    subplot(1, 3, 3);
    plot(psnrArray(1:noisyImIndex));
    title(['PSNR Vs. # Images'], 'FontSize', 16);
    xlabel('# Images');
    ylabel('PSNR');

    section_h_text = [
        '\bf ', 'Section H: Gaussian Noise, Median Filter, PSNR Vs. # Images', ' \rm', ...
        newline, ...
        '# Images loop is 1 to 10', ...
        newline, ...
        newline, ...
        newline, ...
        'Please wait untill simulations ends'
    ];

    sgtitle(section_h_text, 'Color', 'blue')
    disp(section_h_text)
    
    pause(2);

end

section_h_text = [
    '\bf ', 'Section H: Gaussian Noise, Median Filter, PSNR Vs. # Images', ' \rm', ...
    newline, ...
    'As expected, filtering is better for more images', ...
    newline, ...
    newline, ...
    newline, ...
    'Please hit Enter key to continue to the next section'
];

sgtitle(section_h_text, 'Color', 'blue')
disp(section_h_text)

pause

%% Section I

clc;
clear;
close all;

imageFileName = "lena.tif";
im = round(double(imread("Images\" + imageFileName)));

p = 0.1;

images = 10;
imArray = zeros(images, size(im, 1), size(im, 2));
psnrArray = zeros(images);

figure('WindowState', 'maximized');
set(gcf, 'Color', 'white');

subplot(1, 3, 1);
imagesc(im);
title(['Original'], 'FontSize', 16);
colormap('gray');
axis image;
set(gca,'xtick',[]);
set(gca,'ytick',[]);

for noisyImIndex = 1 : images

    [imArray(noisyImIndex, :, :)] = addSPnoise(im, p);
    [cleanIm] = cleanImageMean_multi(imArray(1:noisyImIndex, :, :));
    psnrArray(noisyImIndex) = calcPSNR(cleanIm, im);

    subplot(1, 3, 2);
    imagesc(cleanIm);
    title(['Mean' '# Images: ' + string(noisyImIndex), 'PSNR: ' + string(psnrArray(noisyImIndex))], 'FontSize', 16);
    colormap('gray');
    axis image;
    set(gca,'xtick',[]);
    set(gca,'ytick',[]);

    subplot(1, 3, 3);
    plot(psnrArray(1:noisyImIndex));
    title(['PSNR Vs. # Images'], 'FontSize', 16);
    xlabel('# Images');
    ylabel('PSNR');

    section_i_text = [
        '\bf ', 'Section I: SP Noise, Median Filter, PSNR Vs. # Images', ' \rm', ...
        newline, ...
        '# Images loop is 1 to 10', ...
        newline, ...
        newline, ...
        newline, ...
        'Please wait untill simulations ends'
    ];

    sgtitle(section_i_text, 'Color', 'blue')
    disp(section_i_text)
    
    pause(2);

end

section_i_text = [
    '\bf ', 'Section H: Gaussian Noise, Median Filter, PSNR Vs. # Images', ' \rm', ...
    newline, ...
    'As expected, filtering is better for more images', ...
    newline, ...
    newline, ...
    newline, ...
    'Please hit Enter key to continue to the next section'
];

sgtitle(section_i_text, 'Color', 'blue')
disp(section_i_text)

pause

%% Section J

clc;
clear;
close all;

imageFileName = "lena.tif";
im = round(double(imread("Images\" + imageFileName)));

figure('WindowState', 'maximized');
set(gcf, 'Color', 'white');

subplot(3, 3, 1);
imagesc(im);
title('Original');
colormap('gray');
axis image;
set(gca,'xtick',[]);
set(gca,'ytick',[]);

k = 5;
blurKernel = ones(k, k) ./ k ^ 2;
blurIm = conv2(im, blurKernel, "Same");
subplot(3, 3, 2);
imagesc(blurIm);
title(['Blur', 'k: ' + string(k)]);
colormap('gray');
axis image;
set(gca,'xtick',[]);
set(gca,'ytick',[]);

maskRadius = [2, 2];
maskSTD = 10;
lambda = 1;
[sharpIm] = sharpen(blurIm, maskRadius, maskSTD, lambda);
subplot(3, 3, 3);
imagesc(sharpIm);
title('Sharpen', 'Lambda: ' + string(lambda));
colormap('gray');
axis image;
set(gca,'xtick',[]);
set(gca,'ytick',[]);

k = 5;
blurKernel = ones(k, k) ./ k ^ 2;
blurIm = conv2(im, blurKernel, "Same");
subplot(3, 3, 4);
imagesc(blurIm);
title(['Blur', 'k: ' + string(k)]);
colormap('gray');
axis image;
set(gca,'xtick',[]);
set(gca,'ytick',[]);

maskRadius = [2, 2];
maskSTD = 10;
lambda = 1;
[sharpIm] = sharpen(blurIm, maskRadius, maskSTD, lambda);
subplot(3, 3, 5);
imagesc(sharpIm);
title('Sharpen', 'Lambda_0: ' + string(lambda));
colormap('gray');
axis image;
set(gca,'xtick',[]);
set(gca,'ytick',[]);

maskRadius = [2, 2];
maskSTD = 10;
lambda = 2;
[sharpIm] = sharpen(blurIm, maskRadius, maskSTD, lambda);
subplot(3, 3, 6);
imagesc(sharpIm);
rectangle('Position', [50, 50, 30, 75], 'Curvature', [0.8, 0.4], 'EdgeColor', 'r', 'LineWidth', 2, 'LineStyle', '--')
title('Sharpen', 'Lambda_0: ' + string(lambda));
colormap('gray');
axis image;
set(gca,'xtick',[]);
set(gca,'ytick',[]);

k = 10;
blurKernel = ones(k, k) ./ k ^ 2;
blurIm = conv2(im, blurKernel, "Same");
subplot(3, 3, 7);
imagesc(blurIm);
title(['Blur', 'k: ' + string(k)]);
colormap('gray');
axis image;
set(gca,'xtick',[]);
set(gca,'ytick',[]);

maskRadius = [2, 2];
maskSTD = 10;
lambda = 2;
[sharpIm] = sharpen(blurIm, maskRadius, maskSTD, lambda);
subplot(3, 3, 8);
imagesc(sharpIm);
title('Sharpen', 'Lambda_0: ' + string(lambda));
colormap('gray');
axis image;
set(gca,'xtick',[]);
set(gca,'ytick',[]);

maskRadius = [2, 2];
maskSTD = 10;
lambda = 3;
[sharpIm] = sharpen(blurIm, maskRadius, maskSTD, lambda);
subplot(3, 3, 9);
imagesc(sharpIm);
rectangle('Position', [50, 50, 30, 75], 'Curvature', [0.8, 0.4], 'EdgeColor', 'r', 'LineWidth', 2, 'LineStyle', '--')
title('Sharpen', 'Lambda_0: ' + string(lambda));
colormap('gray');
axis image;
set(gca,'xtick',[]);
set(gca,'ytick',[]);

section_j_text = [
    '\bf ', 'Section J: Shaepenning', ' \rm', ...
    newline, ...
    'First row shows slight sharpening of the blured image', ...
    newline, ...
    'Second row shows Gibbs effect for k=5', ...
    newline, ...
    'Third row shows Gibbs effect for k=10', ...
    newline, ...
    'It can be seen that lambda_0 increases with k', ...
    newline, ...
    newline, ...
    newline, ...
    'Please hit Enter key to continue to the next section'
];

sgtitle(section_j_text, 'Color', 'blue')
disp(section_j_text)
