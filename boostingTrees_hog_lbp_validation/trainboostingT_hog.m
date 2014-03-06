%clear all
savepath_large = 'F:\ProjectInPhd\road_images\largeSmallVehicle\boostingTrees_hog_lbp_validation\data\modelLargeHog.mat';
savepath_small = 'F:\ProjectInPhd\road_images\largeSmallVehicle\boostingTrees_hog_lbp_validation\data\modelSmallHog.mat';
load('data\largeVehicleHog.mat');
load('data\smallVehicleHog.mat');
load('data\negativeHog.mat');

pBoost1=struct('nWeak',120,'verbose',16,'pTree',struct('maxDepth',5));
model_large_hog = adaBoostTrain( store_negative_hog, store_large_positive_hog, pBoost1 );
pBoost2=struct('nWeak',120,'verbose',16,'pTree',struct('maxDepth',5));
model_small_hog = adaBoostTrain( store_negative_hog, store_small_positive_hog, pBoost2 );
save(savepath_large, 'model_large_hog');
save(savepath_small, 'model_small_hog');

