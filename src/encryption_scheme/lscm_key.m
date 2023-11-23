tic;                
%initializing the values
r = 0.80;
X = [];
Y = [];
Y(1) = 0.9;
X(1) = 0.8;
i = 1;
% Generating X and Y sequences
while i < 128 * 128
    m = (1 - r) * (sin(pi * Y(i)));
    X(i + 1) = sin(pi * (4 * r * X(i) * (1 - X(i)) + m));
    j = X(i + 1);
   
    n = (1 - r) * sin(pi * j);
    Y(i + 1) = sin(pi * (4 * r * Y(i) * (1 - Y(i)) + n));
    k = Y(i + 1);
    i = i + 1;
end
keystream = [X; Y];
save('keystream.txt', 'keystream','-ascii');
disp('2D Keystream generated and saved as keystream.txt.');
%time taken
t = toc;            
disp(['Time taken for key stream generation: ', num2str(t), ' seconds']);

