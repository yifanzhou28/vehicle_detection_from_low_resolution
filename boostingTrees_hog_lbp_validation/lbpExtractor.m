clear all
numNeg = 800;
savepath = 'F:\ProjectInPhd\road_images\largeSmallVehicle\boostingTrees_hog_lbp_validation\data\negativeLbp.mat';
DIR = dir('negative\*.jpg');
imgray = imread(['negative\', DIR(1, 1).name]);
lbp = efficientLBP(imgray);
[x, y] = size(lbp);
NumDim = x*y;
store_negative_lbp = zeros(numNeg, NumDim);
for i = 1:numNeg;
    imgray = imread(['negative\', DIR(i, 1).name]);
    lbp = efficientLBP(imgray);
    store_negative_lbp(i, :) = reshape(lbp, [1, NumDim]);
end
save(savepath, 'store_negative_lbp');


savepath = 'F:\ProjectInPhd\road_images\largeSmallVehicle\boostingTrees_hog_lbp_validation\data\largeVehicleLbp.mat';
DIR = dir('positive_large\*.jpg');
imgray = imread(['positive_large\', DIR(1, 1).name]);
lbp = efficientLBP(imgray);
[x, y] = size(lbp);
NumDim = x*y;
store_large_positive_lbp = zeros(length(DIR), NumDim);
for i = 1:length(DIR)
    imgray = imread(['positive_large\', DIR(i, 1).name]);
    lbp = efficientLBP(imgray);
    store_large_positive_lbp(i, :) = reshape(lbp, [1, NumDim]);
end
save(savepath, 'store_large_positive_lbp');

savepath = 'F:\ProjectInPhd\road_images\largeSmallVehicle\boostingTrees_hog_lbp_validation\data\smallVehicleLbp.mat';
DIR = dir('positive_small\*.jpg');
imgray = imread(['positive_small\', DIR(1, 1).name]);
lbp = efficientLBP(imgray);
[x, y] = size(lbp);
NumDim = x*y;
store_small_positive_lbp = zeros(length(DIR), NumDim);
for i = 1:length(DIR)
    imgray = imread(['positive_small\', DIR(i, 1).name]);
    lbp = efficientLBP(imgray);
    store_small_positive_lbp(i, :) = reshape(lbp, [1, NumDim]);
end
save(savepath, 'store_small_positive_lbp');
