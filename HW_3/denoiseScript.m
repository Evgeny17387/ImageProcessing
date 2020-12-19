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
    'This time it is hard to tell which filter is better', ...
    newline, ...
    'Also, the PNSR is very similar', ...
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
