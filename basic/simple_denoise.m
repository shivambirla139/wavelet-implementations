[filename , pathname] = uigetfile('*','Select an image');
filewithpath = strcat(pathname,filename);

img_original = imread(filewithpath);
img_noised = imnoise(img_original,'gaussian',0,0.01);

[thr ,  sorh , keepapp] =  ddencmp('den','wv',img_noised);

img_denoised = wdencmp('gbl',img_noised,'coif5',2,thr,sorh,keepapp);

subplot(1,3,1);
imshow(img_original);
title('original image');

subplot(1,3,2);
imshow(img_noised);
title('noised image');

subplot(1,3,3);
imshow(img_denoised);
title('denoised  image');



