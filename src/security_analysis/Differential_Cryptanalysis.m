% Reading the RGB images
E1 = imread("C:\Users\visma\OneDrive\Documents\AMRITA-MTECH\Minor Project\Implementation\Images\arnolds\1024_AM_encrypted.png");
E2 = imread("C:\Users\visma\OneDrive\Documents\AMRITA-MTECH\Minor Project\Implementation\Images\arnolds\1024_changed_AM_encrypted.png");
E1 = double(E1);
E2 = double(E2);

diff_R = abs(E1(:,:,1) - E2(:,:,1));
diff_G = abs(E1(:,:,2) - E2(:,:,2));
diff_B = abs(E1(:,:,3) - E2(:,:,3));
total_pixels = numel(E1(:,:,1)); 
% NPCR for each channel
npcr_R = (sum(diff_R(:) > 0) / total_pixels) * 100;
npcr_G = (sum(diff_G(:) > 0) / total_pixels) * 100;
npcr_B = (sum(diff_B(:) > 0) / total_pixels) * 100;
% UACI for each channel
uaci_R = (sum(diff_R(:)) / (255 * total_pixels)) * 100;
uaci_G = (sum(diff_G(:)) / (255 * total_pixels)) * 100;
uaci_B = (sum(diff_B(:)) / (255 * total_pixels)) * 100;

fprintf('NPCR (Red Channel): %.6f%%\n', npcr_R);
fprintf('UACI (Red Channel): %.6f%%\n', uaci_R);
fprintf('NPCR (Green Channel): %.6f%%\n', npcr_G);
fprintf('UACI (Green Channel): %.6f%%\n', uaci_G);
fprintf('NPCR (Blue Channel): %.6f%%\n', npcr_B);
fprintf('UACI (Blue Channel): %.6f%%\n', uaci_B);

% Average NPCR and UACI values
average_npcr = (npcr_R + npcr_G + npcr_B) / 3;
average_uaci = (uaci_R + uaci_G + uaci_B) / 3;
fprintf('Average NPCR: %.6f%%\n', average_npcr);
fprintf('Average UACI: %.6f%%\n', average_uaci);

% Plotting the NPCR and UACI values 
channels = {'Red', 'Green', 'Blue'};
npcr_values = [npcr_R, npcr_G, npcr_B];
uaci_values = [uaci_R, uaci_G, uaci_B];
npcr_values_numeric = [npcr_R, npcr_G, npcr_B];
uaci_values_numeric = [uaci_R, uaci_G, uaci_B];
figure;
bar([npcr_values_numeric; uaci_values_numeric]');
set(gca, 'XTickLabel', channels);
xlabel('Channels');
ylabel('Percentage');
legend('NPCR', 'UACI');
title('NPCR and UACI values for Red, Green, and Blue Channels');






