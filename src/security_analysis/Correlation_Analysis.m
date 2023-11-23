% Read the image 
image = imread("C:\Users\visma\OneDrive\Documents\AMRITA-MTECH\Minor Project\Implementation\Imageset\arnolds\512_AM_encrypted.png");
R = double(image(:, :, 1)); % Red 
G = double(image(:, :, 2)); % Green 
B = double(image(:, :, 3)); % Blue 

% Correlation coefficients for each channel horizontally, vertically, and diagonally
C_Horizontal_R = Correlation(R, 1, 0);
C_Vertical_R = Correlation(R, 0, 1);
C_Diagonal_R = Correlation(R, 1, 1);

C_Horizontal_G = Correlation(G, 1, 0);
C_Vertical_G = Correlation(G, 0, 1);
C_Diagonal_G = Correlation(G, 1, 1);

C_Horizontal_B = Correlation(B, 1, 0);
C_Vertical_B = Correlation(B, 0, 1);
C_Diagonal_B = Correlation(B, 1, 1);

% Display correlation coefficients for each channel
fprintf('Red Channel:\n');
fprintf('  %.4f\n', C_Horizontal_R);
fprintf('  %.4f\n', C_Vertical_R);
fprintf('  %.4f\n', C_Diagonal_R);
fprintf('Green Channel:\n');
fprintf('   %.4f\n', C_Horizontal_G);
fprintf('   %.4f\n', C_Vertical_G);
fprintf('   %.4f\n', C_Diagonal_G);
fprintf('Blue Channel:\n');
fprintf('   %.4f\n', C_Horizontal_B);
fprintf('   %.4f\n', C_Vertical_B);
fprintf('   %.4f\n', C_Diagonal_B);

% Function to calculate correlation coefficient
function corr = Correlation(channel, offsetX, offsetY)
    shiftedChannel = circshift(channel, [offsetX, offsetY]);
    cov_XY = mean((channel(:) - mean(channel(:))) .* (shiftedChannel(:) - mean(shiftedChannel(:))));
    var_X = var(channel(:));
    var_Y = var(shiftedChannel(:));
    corr = cov_XY / sqrt(var_X * var_Y);
end
