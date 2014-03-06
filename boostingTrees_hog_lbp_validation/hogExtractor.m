clear all
numNeg = 800;
savepath = 'F:\ProjectInPhd\road_images\largeSmallVehicle\boostingTrees_hog_lbp_validation\data\negativeHog.mat';
DIR = dir('negative\*.jpg');
imgray = imread(['negative\', DIR(1, 1).name]);
cellSize = 8;
hog = vl_hog(single(imgray), cellSize, 'variant', 'dalaltriggs');
[x, y, z] = size(hog);
NumDim = x*y*z;
store_negative_hog = zeros(numNeg, NumDim);
for i = 1:numNeg
    imgray = imread(['negative\', DIR(i, 1).name]);
    hog = vl_hog(single(imgray), cellSize, 'variant', 'dalaltriggs');
    store_negative_hog(i, :) = reshape(hog, [1, NumDim]);
end
save(savepath, 'store_negative_hog');


savepath = 'F:\ProjectInPhd\road_images\largeSmallVehicle\boostingTrees_hog_lbp_validation\data\largeVehicleHog.mat';
DIR = dir('positive_large\*.jpg');
imgray = imread(['positive_large\', DIR(1, 1).name]);
cellSize = 8;
hog = vl_hog(single(imgray), cellSize, 'variant', 'dalaltriggs');
[x, y, z] = size(hog);
NumDim = x*y*z;
store_large_positive_hog = zeros(length(DIR), NumDim);
for i = 1:length(DIR)
    imgray = imread(['positive_large\', DIR(i, 1).name]);
    hog = vl_hog(single(imgray), cellSize, 'variant', 'dalaltriggs');
    store_large_positive_hog(i, :) = reshape(hog, [1, NumDim]);
end
save(savepath, 'store_large_positive_hog');

savepath = 'F:\ProjectInPhd\road_images\largeSmallVehicle\boostingTrees_hog_lbp_validation\data\smallVehicleHog.mat';
DIR = dir('positive_small\*.jpg');
imgray = imread(['positive_small\', DIR(1, 1).name]);
cellSize = 8;
hog = vl_hog(single(imgray), cellSize, 'variant', 'dalaltriggs');
[x, y, z] = size(hog);
NumDim = x*y*z;
store_small_positive_hog = zeros(length(DIR), NumDim);
for i = 1:length(DIR)
    imgray = imread(['positive_small\', DIR(i, 1).name]);
    hog = vl_hog(single(imgray), cellSize, 'variant', 'dalaltriggs');
    store_small_positive_hog(i, :) = reshape(hog, [1, NumDim]);
end
save(savepath, 'store_small_positive_hog');
