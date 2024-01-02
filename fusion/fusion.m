clear;
wavetype = 'sym4';

[filename , pathname] = uigetfile('*','Select an image');
filewithpath = strcat(pathname,filename);
img1 = imread(filewithpath);

[filename , pathname] = uigetfile('*','Select an image');
filewithpath = strcat(pathname,filename);
img2 = imread(filewithpath);


[row,col] = size(img1(:,:,1));

if ~isequal(size(img1),size(img2))
    img2 = imresize(img2,[row,col]);
end


subplot(2,1,1);
imshow(img1);
title('image1');

subplot(2,1,2);
imshow(img2);
title('image2');
fusion_rules = {'MeanMean', 'MeanMin', 'MeanMax', 'MinMean', 'MinMax', 'MinMin', 'MaxMin', 'MaxMax', 'MaxMean'};
figure;

for i = 1:length(fusion_rules)
    fusedimageR = imgfusion(img1(:,:,1), img2(:,:,1), fusion_rules{i}, wavetype);
    fusedimageG = imgfusion(img1(:,:,2), img2(:,:,2), fusion_rules{i}, wavetype);
    fusedimageB = imgfusion(img1(:,:,3), img2(:,:,3), fusion_rules{i}, wavetype);
   
    fusedimage = uint8(cat(3, fusedimageR, fusedimageG, fusedimageB));

    subplot(3, 3, i);
    imshow(fusedimage);
    title([fusion_rules{i} ' image']);
end

