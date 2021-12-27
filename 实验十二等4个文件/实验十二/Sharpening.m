function myColourSharpening(filePath)
   
    I = imread(filePath);
    H = rgb2hsi(I);
    h = H(:, :, 1);
    s = H(:, :, 2);
    i = H(:, :, 3);

    lapmask = [1 1 1; 1 -8 1; 1 1 1];
    
    I1 = imsubtract(I, imfilter(I, lapmask, 'replicate'));

   
    h_filter = imsubtract(h, imfilter(h, lapmask, 'replicate'));
    s_filter = imsubtract(s, imfilter(s, lapmask, 'replicate'));
    i_filter = imsubtract(i, imfilter(i, lapmask, 'replicate'));

    f0 = cat(3, h_filter, s_filter, i_filter);
    f0 = hsi2rgb(f0);
    f0 = min(f0, 1);

    f1 = cat(3, h_filter, s, i);
    f1 = hsi2rgb(f1);
    f1 = min(f1, 1);

    f2 = cat(3, h, s_filter, i);
    f2 = hsi2rgb(f2);
    f2 = min(f2, 1);

    f3 = cat(3, h, s, i_filter);
    f3 = hsi2rgb(f3);
    f3 = min(f3, 1);

    subplot(2, 3, 1);
    imshow(I);


    subplot(2, 3, 2);
    imshow(I1);


    subplot(2, 3, 3);
    imshow(f0);
 

    subplot(2, 3, 4);
    imshow(f1);
  

    subplot(2, 3, 5);
    imshow(f2);
   

    subplot(2, 3, 6);
    imshow(f3);
    
end