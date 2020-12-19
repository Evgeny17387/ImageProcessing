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
radius_index = 0;

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

for radius = 1 : 10

    radius_index = radius_index + 1;
    maskRadius = [radius, radius];
    [cleanImMedian] = cleanImageMedian(noisyIm, maskRadius);
    psnrArray(radius_index) = calcPSNR(cleanImMedian, im);

    subplot(1, 4, 3)
    imagesc(cleanImMedian)
    title(['Median Filter', 'Radisu: ' + string(radius), 'PSNR: ' + string(psnrArray(radius_index))], 'FontSize', 16)
    colormap('gray');
    axis image;
    set(gca,'xtick',[]);
    set(gca,'ytick',[]);

    subplot(1, 4, 4);
    plot(psnrArray(1: radius_index));
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
    'Which is expected since we take more neighbors thus "ruining" the image quality', ...
    newline, ...
    newline, ...
    newline, ...
    'Please hit Enter key to continue to the next section'
];

sgtitle(section_d_text, 'Color', 'blue')
disp(section_d_text)

pause
