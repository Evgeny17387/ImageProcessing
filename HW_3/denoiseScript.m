%% Section Aconv2

clc;
clear;
close all;

imageFileName = "lena.tif";
p = 0.1;
maskRadius = [1, 1];
maskSTD = 10;

im = round(double(imread("Images\" + imageFileName)));

[noisySPIm] = addSPnoise(im, p);
[cleanImMedian] = cleanImageMedian(noisySPIm, maskRadius);
[cleanImMean] = cleanImageMean(noisySPIm, maskRadius, maskSTD);

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
imagesc(noisySPIm)
title(['With SP Noise', 'PSNR: ' + string(calcPSNR(noisySPIm, im))], 'FontSize', 16)
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
