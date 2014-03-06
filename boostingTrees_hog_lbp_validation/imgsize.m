clear all
close all

path0 = 'raw_negative\';
path = 'raw_negative\*.jpg';
writepath = 'negative\';
D = dir(path);
for i = 1:size(D, 1)
    im = imread([path0, D(i, 1).name]);
    if size(im, 3) == 3
        imgray = rgb2gray(im);
    else
        imgray = im;
    end
    imgray = cv.resize(imgray, [20, 20]);
    imwrite(imgray, [writepath, num2str(i), '.jpg'], 'JPEG');
    fprintf('image: %d finished!!! \n', i);
end
