%reading images
image1 = imread("C:\Users\visma\OneDrive\Documents\AMRITA-MTECH\Minor Project\Implementation\Images\bakers\128_BM_encrypted.png");
image2 = imread("C:\Users\visma\OneDrive\Documents\AMRITA-MTECH\Minor Project\Implementation\Images\bakers\128_BM_Kchanged.png");
%checking matched pixels
if size(image1) ~= size(image2)
  disp('images sizes are different')
else
[w,l] = size(image1);
count = 0;
for i = 1:w
  for j = 1:l
    if image1(i,j) == image2(i,j)
      count = count+1;
     end
   end
 end
 
 percentage_matched = [count/(w*l)]*100;
 fprintf('Percentage of matched pixels: %f\n', percentage_matched);
end

