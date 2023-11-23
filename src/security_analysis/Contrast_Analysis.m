% image paths
imagepaths = {'128_AM_encrypted.png', '256_AM_encrypted.png', '512_AM_encrypted.png', '1024_AM_encrypted.png'};
imagesizes = {'128x128', '256x256', '512x512', '1024x1024'};
contrast_R = zeros(1, length(imagepaths));
contrast_G = zeros(1, length(imagepaths));
contrast_B = zeros(1, length(imagepaths));

for i = 1:length(imagepaths)
    img = imread(imagepaths{i});
    contrast_R(i) = calculate_contrast(img(:,:,1));
    contrast_G(i) = calculate_contrast(img(:,:,2));
    contrast_B(i) = calculate_contrast(img(:,:,3));
    fprintf('Contrast for R channel of %s is %f\n', imagesizes{i}, contrast_R(i));
    fprintf('Contrast for G channel of %s is %f\n', imagesizes{i}, contrast_G(i));
    fprintf('Contrast for B channel of %s is %f\n', imagesizes{i}, contrast_B(i));
end

% Plotting bar graph
figure;
bar([contrast_R', contrast_G', contrast_B']);
set(gca, 'XTickLabel', imagesizes);
xlabel('Image Size');
ylabel('Contrast');
legend('R Channel', 'G Channel', 'B Channel');
legend('R Channel', 'G Channel', 'B Channel', 'Location', 'NorthEast');
title('Contrast Analysis for Different Image Sizes and Channels');
ylim([60, 130]);

%function
function contrast_value = calculate_contrast(channel)
    [m, n] = size(channel);
    mean_intensity = mean(channel(:));
    contrast_value = sum(sum((channel - mean_intensity).^2)) / (m * n);
end
