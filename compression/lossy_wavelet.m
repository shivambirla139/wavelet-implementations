clc;
clear;
src = imread('io/lena256rgb.png');

dimension = numel(size(src));

if dimension == 3
    disp('Color image');
    for channel = 1:3
        [LL, LH, HL, HH] = dwt2(src(:,:,channel), 'haar');
        quantization_step = 50;
        LL_quantized = round(LL / quantization_step) * quantization_step;
        LH_quantized = round(LH / quantization_step) * quantization_step;
        HL_quantized = round(HL / quantization_step) * quantization_step;
        HH_quantized = round(HH / quantization_step) * quantization_step;
        compressed_channel = idwt2(LL_quantized, LH_quantized, HL_quantized, HH_quantized, 'haar');
        compressed_image(:,:,channel) = compressed_channel;
    end
   % subplot(1, 2, 1);
    %imshow(src);
    %title('Original Image');
    %subplot(1, 2, 2);
   % imshow(uint8(compressed_image));
    %title('Compressed Image');
    imwrite(uint8(compressed_image), 'io/Lossythr50.png');
end
