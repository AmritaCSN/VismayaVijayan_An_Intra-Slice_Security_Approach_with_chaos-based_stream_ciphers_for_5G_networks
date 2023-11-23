tic;                    
% Parameters for Arnold's Cat Map
N = 256; 
iterations = 50; 
x = 0.8; 
y = 0.9;

key_stream = zeros(N, N, iterations);
key_stream(:, :, 1) = randi([0, 255], N, N); 
for i = 2:iterations
    x_new = mod(2 * x + y, 1);
    y_new = mod(x + y, 1);
    x_index = round(x_new * (N - 1)) + 1;
    y_index = round(y_new * (N - 1)) + 1;
    key_stream(:, :, i) = key_stream(x_index, y_index, 1);
    %update x and y
    x = x_new;
    y = y_new;
end

fid = fopen('arnold_key.txt', 'w');
for k = 1:iterations
    for i = 1:N
        for j = 1:N
            fprintf(fid, '%d ', key_stream(i, j, k));
        end
        fprintf(fid, '\n');
    end
end
fclose(fid);
disp('Key stream has been saved as arnold_key.txt.');


%memory and time end
t = toc;            
disp(['Time taken for key stream generation: ', num2str(t), ' seconds']);
