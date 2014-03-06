clear all
load('F:\ProjectInPhd\road_images\largeSmallVehicle\boostingTrees_hog_lbp_validation\data\modelLargeHog.mat');
load('F:\ProjectInPhd\road_images\largeSmallVehicle\boostingTrees_hog_lbp_validation\data\modelSmallHog.mat');
load('F:\ProjectInPhd\road_images\largeSmallVehicle\boostingTrees_hog_lbp_validation\data\modelLargeLbp.mat');
load('F:\ProjectInPhd\road_images\largeSmallVehicle\boostingTrees_hog_lbp_validation\data\modelSmallLbp.mat');

[filename, pathname] = uigetfile('F:\ProjectInPhd\road_images\rawImages\testing\*.jpg');
HaarCascadeDetector
simpleApplyboostingT_hog_lbp

%batch
% DIR = dir('F:\ProjectInPhd\road_images\rawImages\testing\*.jpg');
% 
% for i = 1:length(DIR)
%     tic
%     filename = DIR(i, 1).name;
%     pathname = 'F:\ProjectInPhd\road_images\rawImages\testing\';
%     HaarCascadeDetector
%     simpleApplyboostingT_hog_lbp
%     print(gcf,'-djpeg',['F:\ProjectInPhd\road_images\largeSmallVehicle\boostingTrees_hog_lbp_validation\figures\', filename]);
%     fprintf('Image %d finished!! \n', i);
%     toc
% end

