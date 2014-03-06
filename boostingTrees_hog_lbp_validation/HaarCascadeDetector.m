%clear all

im = imread([pathname, filename]);
imgray = rgb2gray(im);
imgray = imresize(imgray, 2);
%imhist = histeq(imgray);
large_classifier_xml_haar = 'F:\ProjectInPhd\road_images\largeSmallVehicle\boostingTrees_hog_lbp_validation\detectorData\cascade_haar_large.xml';
small_classifier_xml_haar = 'F:\ProjectInPhd\road_images\largeSmallVehicle\boostingTrees_hog_lbp_validation\detectorData\cascade_haar_small.xml';
large_classifier_haar = cv.CascadeClassifier(large_classifier_xml_haar);
small_classifier_haar = cv.CascadeClassifier(small_classifier_xml_haar);
large_objects_haar = large_classifier_haar.detect(imgray, 'ScaleFactor', 1.005, 'MinNeighbors', 3, 'MinSize', [20 20]);
small_objects_haar = small_classifier_haar.detect(imgray, 'ScaleFactor', 1.005, 'MinNeighbors', 3, 'MinSize', [20 20]);
