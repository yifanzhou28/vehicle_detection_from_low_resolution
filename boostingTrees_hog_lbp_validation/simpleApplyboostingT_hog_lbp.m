cellSize = 8;

figure(2),subplot(2, 2, 1),imshow(imgray),title('created by HAAR'),hold on;
figure(2),subplot(2, 2, 2),imshow(imgray),title('validated by LBP'),hold on;
figure(2),subplot(2, 2, 3),imshow(imgray), title('validated by HOG'),hold on;
figure(2),subplot(2, 2, 4),imshow(imgray), title('validated by LBP&HOG'),hold on;

%%large Vehicles
for i = 1:numel(large_objects_haar)
    temp = large_objects_haar{i};
    y1 = temp(1, 2)+1;
    y2 = temp(1, 2)+temp(1, 4);
    x1 = temp(1, 1)+1;
    x2 = temp(1, 1)+temp(1, 3);
    if y2 > size(imgray, 1)
        y2 = size(imgray, 1);
    end
    if x2 > size(imgray, 2)
        x2 = size(imgray, 2);
    end
    imtemp = imgray(y1:y2, x1:x2);
    imtemp = imresize(imtemp, [20, 20]);
    lbp = efficientLBP(imtemp);
    hog = vl_hog(single(imtemp), cellSize, 'variant', 'dalaltriggs');
    [xl, yl] = size(lbp);
    [xh, yh, zh] = size(hog);
    NumDimLbp = xl*yl;
    NumDimHog = xh*yh*zh;
    testdataLbp = reshape(lbp, [1, NumDimLbp]);
    testdataHog = reshape(hog, [1, NumDimHog]);
    
    result_lbp = adaBoostApply( double(testdataLbp), model_large_lbp);
    result_hog = adaBoostApply( double(testdataHog), model_large_hog);
    
    figure(2),subplot(2, 2, 1),hold on;
    rectangle('Position', large_objects_haar{i});
    
    if result_lbp >= 5
        figure(2),subplot(2, 2, 2),hold on;
        rectangle('Position', large_objects_haar{i});
    end
    
    if result_hog >= 5
        figure(2),subplot(2, 2, 3),hold on;
        rectangle('Position', large_objects_haar{i});
    end
    
    if result_lbp >= 5 && result_hog >= 5
        figure(2),subplot(2, 2, 4),hold on;
        rectangle('Position', large_objects_haar{i});
    elseif result_lbp >= 20
        figure(2),subplot(2, 2, 4),hold on;
        rectangle('Position', large_objects_haar{i});
    elseif result_hog >= 20
        figure(2),subplot(2, 2, 4),hold on;
        rectangle('Position', large_objects_haar{i});
    end
    
end

%%small Vehicles
for i = 1:numel(small_objects_haar)
    temp = small_objects_haar{i};
    y1 = temp(1, 2)+1;
    y2 = temp(1, 2)+temp(1, 4);
    x1 = temp(1, 1)+1;
    x2 = temp(1, 1)+temp(1, 3);
    if y2 > size(imgray, 1)
        y2 = size(imgray, 1);
    end
    if x2 > size(imgray, 2)
        x2 = size(imgray, 2);
    end
    
    imtemp = imgray(y1:y2, x1:x2);
    imtemp = imresize(imtemp, [20, 20]);
    lbp = efficientLBP(imtemp);
    hog = vl_hog(single(imtemp), cellSize, 'variant', 'dalaltriggs');
    [xl, yl] = size(lbp);
    [xh, yh, zh] = size(hog);
    NumDimLbp = xl*yl;
    NumDimHog = xh*yh*zh;
    testdataLbp = reshape(lbp, [1, NumDimLbp]);
    testdataHog = reshape(hog, [1, NumDimHog]);
    
    result_lbp = adaBoostApply( double(testdataLbp), model_small_lbp);
    result_hog = adaBoostApply( double(testdataHog), model_small_hog);
    
    figure(2),subplot(2, 2, 1),hold on;
    rectangle('Position', small_objects_haar{i});
    
    if result_lbp >= 5
        figure(2),subplot(2, 2, 2),hold on;
        rectangle('Position', small_objects_haar{i});
    end
    
    if result_hog >= 5
        figure(2),subplot(2, 2, 3),hold on;
        rectangle('Position', small_objects_haar{i});
    end
    
    if result_lbp >= 5 && result_hog >= 5
        figure(2),subplot(2, 2, 4),hold on;
        rectangle('Position', small_objects_haar{i});
    elseif result_lbp >= 20
        figure(2),subplot(2, 2, 4),hold on;
        rectangle('Position', small_objects_haar{i});
    elseif result_hog >= 20
        figure(2),subplot(2, 2, 4),hold on;
        rectangle('Position', small_objects_haar{i});
    end
    
end