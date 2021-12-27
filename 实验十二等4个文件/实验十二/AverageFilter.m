function AverageFilter(filePath)
    
    I = imread(filePath);
    H = rgb2hsi(I);
    h = H(:, :, 1);
    s = H(:, :, 2);
    i = H(:, :, 3);

   
    w = fspecial('average', 25);
    
    I1 = imfilter(I, w, 'replicate');

    
    h_filtered = imfilter(h, w, 'replicate');
    s_filtered = imfilter(s, w, 'replicate');
    i_filtered = imfilter(i, w, 'replicate');

    f0 = cat(3, h_filtered, s_filtered, i_filtered);
    f0 = hsi2rgb(f0);
    f0 = min(f0, 1);

    f1 = cat(3, h_filtered, s, i);
    f1 = hsi2rgb(f1);
    f1 = min(f1, 1);

    f2 = cat(3, h, s_filtered, i);
    f2 = hsi2rgb(f2);
    f2 = min(f2, 1);

    f3 = cat(3, h, s, i_filtered);
    f3 = hsi2rgb(f3);
    f3 = min(f3, 1);

    subplot(2, 3, 1);
    imshow(I);
    title('Raw Image');

    subplot(2, 3, 2);
    imshow(I1);
    title('RGB Average filter');

    subplot(2, 3, 3);
    imshow(f0);
    title('HSI AverageFilter');

    subplot(2, 3, 4);
    imshow(f1);
    title('HSI H-AverageFilter');

    subplot(2, 3, 5);
    imshow(f2);
    title('HSI S-AverageFilter');

    subplot(2, 3, 6);
    imshow(f3);
    title('HSI I-AverageFilter');

end