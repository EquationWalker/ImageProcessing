function myImg(filename)
    g = imread(filename);
    g1 = imnoise(g, 'gaussian');
    g2 = imnoise(g, 'salt & pepper');
    f11 = spfilt(g1, 'amean');
    f12 = spfilt(g1, 'gmean');
    f13 = spfilt(g1, 'median');
    f14 = spfilt(g1, 'atrimmed');
    f21 = spfilt(g2, 'amean');
    f22 = spfilt(g2, 'gmean');
    f23 = spfilt(g2, 'median');
    f24 = spfilt(g2, 'atrimmed');

    subplot(2, 3, 1);
    imshow(g);
    
    subplot(2, 3, 2);
    imshow(g1);
    
    subplot(2, 3, 3);
    imshow(f11);
    
    subplot(2, 3, 4);
    imshow(f12);
  
    subplot(2, 3, 5);
    imshow(f13);

    subplot(2, 3, 6);
    imshow(f14);
  

    figure
    subplot(2, 3, 1);
    imshow(g);

    subplot(2, 3, 2);
    imshow(g2);
 
    subplot(2, 3, 3);
    imshow(f21);

    subplot(2, 3, 4);
    imshow(f22);

    subplot(2, 3, 5);
    imshow(f23);
    subplot(2, 3, 6);
    imshow(f24);
    

end