[filename , pathname] = uigetfile('*','Select an image');
filewithpath = strcat(pathname,filename);
img_original = imread(filewithpath);


subplot(1,2,1);
imshow((img_original));
title('Orignal image');

sigma = 0.08;
gaussianNoise = sqrt(sigma) * randn(size(img_original));
img_noisy = imnoise(img_original, 'gaussian', 0.04, sigma^2);


subplot(1,2,2);
imshow((img_noisy));
title('Noised image');
