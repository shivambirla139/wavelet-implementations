clc;
clear;
src = imread('io/lena256rgb.png');
[r,c]=size(src);
a=size(src);
dimension=numel(a);

if dimension==3
disp('color image');
subplot(1,2,1);
imshow(src);
title('The original image');
imwrite(src,'io/RGBImage.png','png');
imageR = src(:,:,1);
imageG = src(:,:,2);
imageB = src(:,:,3);
thr=10;
[ca1,ch1,cv1,cd1]=dwt2(imageR,'haar');
[ca2,ch2,cv2,cd2]=dwt2(ca1,'haar');
[ca3,ch3,cv3,cd3]=dwt2(ca2,'haar');

disp('Number of zeros for three-level wavelet threshold processing of R component:');
res3=idwt2(ca3,ch3,cv3,cd3,'haar');
disp('Number of zeros for R component secondary wavelet threshold processing:');
res2=idwt2(res3,ch2,cv2,cd2,'haar');
disp('Number of zeros for R component level one wavelet threshold processing:');
resR=idwt2(res3,ch1,cv1,cd1,'haar');


[ca1,ch1,cv1,cd1]=dwt2(imageG,'haar');
[ca2,ch2,cv2,cd2]=dwt2(ca1,'haar');
[ca3,ch3,cv3,cd3]=dwt2(ca2,'haar');


disp('G component three-level wavelet threshold processing zero number:');
res3=idwt2(ca3,ch3,cv3,cd3,'haar');
disp('G component secondary wavelet threshold processing zero number:');
res2=idwt2(res3,ch2,cv2,cd2,'haar');
disp('G component first-level wavelet threshold processing zero number:');
resG=idwt2(res3,ch1,cv1,cd1,'haar');


[ca1,ch1,cv1,cd1]=dwt2(imageB,'haar');
[ca2,ch2,cv2,cd2]=dwt2(ca1,'haar');
[ca3,ch3,cv3,cd3]=dwt2(ca2,'haar');


disp('B component three-level wavelet threshold processing zero number:');
res3=idwt2(ca3,ch3,cv3,cd3,'haar');
disp('B component secondary wavelet threshold processing zero number:');
res2=idwt2(res3,ch2,cv2,cd2,'haar');
disp('B component first-level wavelet threshold processing zero number:');
resB=idwt2(res3,ch1,cv1,cd1,'haar');

image_RGB(:,:,1)=uint8(resR);
image_RGB(:,:,2)=uint8(resG);
image_RGB(:,:,3)=uint8(resB);
imwrite(image_RGB,'io/level3Compression.png','png');
subplot(1,2,2);
imshow(image_RGB);title('Threshold processing three-level reconstructed image');
end