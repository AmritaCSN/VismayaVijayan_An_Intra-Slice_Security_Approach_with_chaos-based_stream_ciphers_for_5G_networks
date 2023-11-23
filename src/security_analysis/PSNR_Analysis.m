encrypted_image = imread("C:\Users\visma\OneDrive\Documents\AMRITA-MTECH\Minor Project\Implementation\Imageset\arnolds\1024_AM_encrypted.png");
plain_image = imread("C:\Users\visma\OneDrive\Documents\AMRITA-MTECH\Minor Project\Implementation\Imageset\arnolds\1024 x 1024.png");
%encrypted image components
encrypted_R = double(encrypted_image(:, :, 1));
encrypted_G = double(encrypted_image(:, :, 2));
encrypted_B = double(encrypted_image(:, :, 3));
%plain image components
original_R = double(plain_image(:, :, 1));
original_G = double(plain_image(:, :, 2));
original_B = double(plain_image(:, :, 3));
% MSE for each channel
mseR = sum(sum((original_R - encrypted_R).^2)) / numel(original_R);
mseG = sum(sum((original_G - encrypted_G).^2)) / numel(original_G);
mseB = sum(sum((original_B - encrypted_B).^2)) / numel(original_B);

% Calculate PSNR for each channel
maxPixelValue = 255; 
psnrR = 10 * log10((maxPixelValue^2) / mseR);
psnrG = 10 * log10((maxPixelValue^2) / mseG);
psnrB = 10 * log10((maxPixelValue^2) / mseB);

fprintf('Red Channel:\n');
fprintf('  MSE: %.2f\n', mseR);
fprintf('  PSNR: %.2f dB\n', psnrR);
fprintf('Green Channel:\n');
fprintf('  MSE: %.2f\n', mseG);
fprintf('  PSNR: %.2f dB\n', psnrG);
fprintf('Blue Channel:\n');
fprintf('  MSE: %.2f\n', mseB);
fprintf('  PSNR: %.2f dB\n', psnrB);

