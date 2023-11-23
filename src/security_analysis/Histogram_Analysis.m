% Reading images
plain_image = imread("C:\Users\visma\OneDrive\Documents\AMRITA-MTECH\Minor Project\Implementation\Imageset\2d-lscm\512 x 512.png");
encrypted_image = imread("C:\Users\visma\OneDrive\Documents\AMRITA-MTECH\Minor Project\Implementation\Imageset\2d-lscm\512_encrypted.png");
% Split RGB components
plain_R = plain_image(:,:,1);
plain_G = plain_image(:,:,2);
plain_B = plain_image(:,:,3);
encrypted_R = encrypted_image(:,:,1);
encrypted_G = encrypted_image(:,:,2);
encrypted_B = encrypted_image(:,:,3);

% Histograms for R, G, B components of plain image
subplot(2, 3, 1);
imhist(plain_R);
title('Plain Image R Histogram');
subplot(2, 3, 2);
imhist(plain_G);
title('Plain Image G Histogram');
subplot(2, 3, 3);
imhist(plain_B);
title('Plain Image B Histogram');

% Histograms for R, G, B components of encrypted image
subplot(2, 3, 4);
imhist(encrypted_R);
title('Encrypted Image R Histogram');
subplot(2, 3, 5);
imhist(encrypted_G);
title('Encrypted Image G Histogram');
subplot(2, 3, 6);
imhist(encrypted_B);
title('Encrypted Image B Histogram');
