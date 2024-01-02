[filename , pathname] = uigetfile('*','Select an image');
filewithpath = strcat(pathname,filename);

img_original = imread(filewithpath);

img_original = double(img_original);
[cA,cH,cV,cD] = dwt2(img_original,'sym6','mode','sym');

subplot(2,2,1);
imshow(uint8(cA),[]);
title('Approximation Coefficients');

subplot(2,2,2);
imshow(uint8(cH),[]);
title('Horizontal Coefficients');

subplot(2,2,3);
imshow(uint8(cV),[]);
title('Vertical Coefficients');

subplot(2,2,4);
imshow(uint8(cD),[]);
title('Diagonal Coefficients');

img_reconstructed = idwt2(cA,cH,cV,cD,'Haar','mode','sym');

figure(2);
imshow(uint8(img_reconstructed));
title('Reconstructed image');
