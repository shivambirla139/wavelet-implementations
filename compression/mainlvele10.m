clc;
clear;
src = imread('io/lena256rgb.png');
[r,c]=size(src);
a=size(src);
dimension=numel(a);
if dimension==2
disp('Grayscale image');
subplot(1,3,1);
imshow(src);
imwrite(src,'io/GrayImage.png','png');
axis square;
title('The original image');
thr=0;

[ca1,ch1,cv1,cd1]=dwt2(src,'haar');
res0=idwt2(ca1,ch1,cv1,cd1,'haar');
subplot(1,3,2);
imshow(uint8(res0))
title ('Lossless reconstruction (control group)');
[ca2,ch2,cv2,cd2]=dwt2(ca1,'haar');
[ca3,ch3,cv3,cd3]=dwt2(ca2,'haar');
[ca4,ch4,cv4,cd4]=dwt2(ca3,'haar');
[ca5,ch5,cv5,cd5]=dwt2(ca4,'haar');
[ca6,ch6,cv6,cd6]=dwt2(ca6,'haar');

res6=idwt2(ca5,ch5,cv5,cd5,'haar')
res5=idwt2(res6,ch5,cv5,cd5,'haar');
res4=idwt2(res5,ch4,cv4,cd4,'haar');
res3=idwt2(res4,ch3,cv3,cd3,'haar');
res2=idwt2(res3,ch2,cv2,cd2,'haar');
res1=idwt2(res2,ch1,cv1,cd1,'haar');

subplot(1,3,3);
imshow(uint8(res1));
imwrite(uint8(res1),'io/CompressedGrayImage.png','png');
title ('Reconstruction after three-level transformation threshold processing');
end

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
[ca4,ch4,cv4,cd4]=dwt2(ca3,'haar');
[ca5,ch5,cv5,cd5]=dwt2(ca4,'haar');

res5=idwt2(ca5,ch5,cv5,cd5,'haar');
res4=idwt2(res5,ch4,cv4,cd4,'haar');
res3=idwt2(res4,ch3,cv3,cd3,'haar');
res2=idwt2(res3,ch2,cv2,cd2,'haar');
resR=idwt2(res2,ch1,cv1,cd1,'haar');


[ca1,ch1,cv1,cd1]=dwt2(imageG,'haar');
[ca2,ch2,cv2,cd2]=dwt2(ca1,'haar');
[ca3,ch3,cv3,cd3]=dwt2(ca2,'haar');
[ca4,ch4,cv4,cd4]=dwt2(ca3,'haar');
[ca5,ch5,cv5,cd5]=dwt2(ca4,'haar');

res5=idwt2(ca5,ch5,cv5,cd5,'haar');
res4=idwt2(res5,ch4,cv4,cd4,'haar');
disp('G component three-level wavelet threshold processing zero number:');
res3=idwt2(res4,ch3,cv3,cd3,'haar');
disp('G component secondary wavelet threshold processing zero number:');
res2=idwt2(res3,ch2,cv2,cd2,'haar');
disp('G component first-level wavelet threshold processing zero number:');
resG=idwt2(res2,ch1,cv1,cd1,'haar');


[ca1,ch1,cv1,cd1]=dwt2(imageB,'haar');
[ca2,ch2,cv2,cd2]=dwt2(ca1,'haar');
[ca3,ch3,cv3,cd3]=dwt2(ca2,'haar');
[ca4,ch4,cv4,cd4]=dwt2(ca3,'haar');
[ca5,ch5,cv5,cd5]=dwt2(ca4,'haar');

res5=idwt2(ca5,ch5,cv5,cd5,'haar');
res4=idwt2(res5,ch4,cv4,cd4,'haar');
disp('B component three-level wavelet threshold processing zero number:');
res3=idwt2(res4,ch3,cv3,cd3,'haar');
disp('B component secondary wavelet threshold processing zero number:');
res2=idwt2(res3,ch2,cv2,cd2,'haar');
disp('B component first-level wavelet threshold processing zero number:');
resB=idwt2(res2,ch1,cv1,cd1,'haar');

image_RGB(:,:,1)=uint8(resR);
image_RGB(:,:,2)=uint8(resG);
image_RGB(:,:,3)=uint8(resB);
imwrite(image_RGB,'io/level5.png','png');
subplot(1,2,2);
imshow(image_RGB);title('Threshold processing three-level reconstructed image');
end