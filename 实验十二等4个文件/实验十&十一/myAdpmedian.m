function myAdpmedian(filePath)
    g = imread(filePath);

    f = imnoise(g, 'salt & pepper', .25);

    g1 = medfilt2(f, [7 7], 'symmetric');

    g2 = adpmedian(f, 7);

    subplot(2, 2, 1);
    imshow(g);
    

    subplot(2, 2, 2);
    imshow(f);
    

    subplot(2, 2, 3);
    imshow(g1);
    

    subplot(2, 2, 4);
    imshow(g2);
    

end