[filename , pathname] = uigetfile('*','Select an image');
filewithpath = strcat(pathname,filename);
img_original = imread(filewithpath);
img_original = double(img_original);

n = input('Enter the level of decomposition : ');
dwtmode('per');
[C , S] = wavedec2(img_original,n,'db5');

[cHn , cVn, cDn] = detcoef2('all',C,S,n);
cAn = appcoef2(C,S,'db5',n);

subplot(2,2,1);
imshow(uint8(cAn),[]);
title(strcat('Approximation decomposition level : ' , num2str(n)));

subplot(2,2,2);
imshow(uint8(cHn),[]);
title(strcat('Horizontal decomposition level : ' , num2str(n)));

subplot(2,2,3);
imshow(uint8(cVn),[]);
title(strcat('vertical decomposition level : ' , num2str(n)));

subplot(2,2,4);
imshow(uint8(cDn),[]);
title(strcat('Diagonal decomposition level : ' , num2str(n)));


img_reconstructed = waverec2(C,S,'Haar');
figure(2);
imshow(uint8(img_reconstructed));
title('Reconstructed image') ;

