clc;
clear;
img = imread('1024 x 1024.png');
[h, w, d] = size(img);
x = randi(w);
y = randi(h);
output = img;
output(y, x, :) = randi([0 255], [1 1 d]);
imwrite(output,'1024_changed.png')
