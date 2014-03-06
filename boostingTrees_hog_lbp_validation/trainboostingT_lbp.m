%clear all
savepath_large = 'F:\ProjectInPhd\road_images\largeSmallVehicle\boostingTrees_hog_lbp_validation\data\modelLargeLbp.mat';
savepath_small = 'F:\ProjectInPhd\road_images\largeSmallVehicle\boostingTrees_hog_lbp_validation\data\modelSmallLbp.mat';
load('data\largeVehicleLbp.mat');
load('data\smallVehicleLbp.mat');
load('data\negativeLbp.mat');

%combine the dataset
%data = zeros(store_positive_hog+store_negative_hog, dim);
% data_large = [store_large_positive_lbp; store_negative_lbp];
% data_small = [store_small_positive_lbp; store_negative_lbp];

%train the model
pBoost1=struct('nWeak',120,'verbose',16,'pTree',struct('maxDepth',3));
model_large_lbp = adaBoostTrain( store_negative_lbp, store_large_positive_lbp, pBoost1 );
pBoost2=struct('nWeak',120,'verbose',16,'pTree',struct('maxDepth',3));
model_small_lbp = adaBoostTrain( store_negative_lbp, store_small_positive_lbp, pBoost2 );
save(savepath_large, 'model_large_lbp');
save(savepath_small, 'model_small_lbp');
