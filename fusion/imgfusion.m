function outimage = imgfusion(img1,img2,fusiontype,wavetype)

img1 = double(img1);
img2 = double(img2);

[cA1,cH1,cV1,cD1] = dwt2(img1,wavetype,'per');
[cA2,cH2,cV2,cD2] = dwt2(img2,wavetype,'per');

[row,col] = size(cA1);
cA = zeros(row,col);
cH = zeros(row,col);
cV = zeros(row,col);
cD = zeros(row,col);

switch fusiontype
    case 'MeanMean'
        for i = 1:row
            for j = 1:col
                cA(i,j) = mean([cA1(i,j), cA2(i,j)]);
                cH(i,j) = mean([cH1(i,j), cH2(i,j)]);
                cV(i,j) = mean([cV1(i,j), cV2(i,j)]);
                cD(i,j) = mean([cD1(i,j), cD2(i,j)]);
            end
        end
    case 'MeanMax'
        for i = 1:row
            for j = 1:col
                cA(i,j) = mean([cA1(i,j), cA2(i,j)]);
                cH(i,j) = max([cH1(i,j), cH2(i,j)]);
                cV(i,j) = max([cV1(i,j), cV2(i,j)]);
                cD(i,j) = max([cD1(i,j), cD2(i,j)]);
            end
        end
    case 'MeanMin'
        for i = 1:row
            for j = 1:col
                cA(i,j) = mean([cA1(i,j), cA2(i,j)]);
                cH(i,j) = min([cH1(i,j), cH2(i,j)]);
                cV(i,j) = min([cV1(i,j), cV2(i,j)]);
                cD(i,j) = min([cD1(i,j), cD2(i,j)]);
            end
        end
    case 'MaxMin'
        for i = 1:row
            for j = 1:col
                cA(i,j) = max([cA1(i,j), cA2(i,j)]);
                cH(i,j) = min([cH1(i,j), cH2(i,j)]);
                cV(i,j) = min([cV1(i,j), cV2(i,j)]);
                cD(i,j) = min([cD1(i,j), cD2(i,j)]);
            end
        end
    case 'MaxMean'
        for i = 1:row
            for j = 1:col
                cA(i,j) = max([cA1(i,j), cA2(i,j)]);
                cH(i,j) = mean([cH1(i,j), cH2(i,j)]);
                cV(i,j) = mean([cV1(i,j), cV2(i,j)]);
                cD(i,j) = mean([cD1(i,j), cD2(i,j)]);
            end
        end
    case 'MaxMax'
        for i = 1:row
            for j = 1:col
                cA(i,j) = max([cA1(i,j), cA2(i,j)]);
                cH(i,j) = max([cH1(i,j), cH2(i,j)]);
                cV(i,j) = max([cV1(i,j), cV2(i,j)]);
                cD(i,j) = max([cD1(i,j), cD2(i,j)]);
            end
        end
    case 'MinMin'
        for i = 1:row
            for j = 1:col
                cA(i,j) = min([cA1(i,j), cA2(i,j)]);
                cH(i,j) = min([cH1(i,j), cH2(i,j)]);
                cV(i,j) = min([cV1(i,j), cV2(i,j)]);
                cD(i,j) = min([cD1(i,j), cD2(i,j)]);
            end
        end
    case 'MinMean'
        for i = 1:row
            for j = 1:col
                cA(i,j) = min([cA1(i,j), cA2(i,j)]);
                cH(i,j) = mean([cH1(i,j), cH2(i,j)]);
                cV(i,j) = mean([cV1(i,j), cV2(i,j)]);
                cD(i,j) = mean([cD1(i,j), cD2(i,j)]);
            end
        end
    case 'MinMax'
        for i = 1:row
            for j = 1:col
                cA(i,j) = min([cA1(i,j), cA2(i,j)]);
                cH(i,j) = max([cH1(i,j), cH2(i,j)]);
                cV(i,j) = max([cV1(i,j), cV2(i,j)]);
                cD(i,j) = max([cD1(i,j), cD2(i,j)]);
            end
        end
    otherwise
        error('Invalid ftype specified.');
end


outimage = idwt2(cA,cH,cV,cD,wavetype,'per');