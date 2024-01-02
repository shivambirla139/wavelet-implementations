img = imread('io/lena256rgb.png');
imgfft=fft2(img);
imgsort = sort(abs(imgfft(:)));
counter=0;
for Keep = [.95 .1 .05 .001]
    threshold = imgsort(floor((1-Keep)*length(imgsort)));
    Ind = abs(imgfft)>threshold;
    imgtlow = imgfft.*Ind; 
    imglow = uint8(ifft2(imgtlow));
    s = whos('imglow');
    totSize = s.bytes;
    counter=counter+1;
    figure(counter)
    imshow(imglow)
    saveas(gcf,strcat(['io/FFT_IMG', num2str(counter) '.jpeg']));
    s = dir(strcat(['io/FFT_IMG', num2str(counter) '.jpeg']));
    filesize(counter)=s.bytes;
    title(['updated image file size is: ' num2str(s.bytes)]);
end