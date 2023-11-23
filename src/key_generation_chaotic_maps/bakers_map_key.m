tic;                    
% Initial values
num_rows = 128;
num_cols = 128;
key_stream = [];
x = 0.8;
y = 0.9;
%bakers map formulas
for i = 1:num_rows
    row_values = []; 
    for j = 1:num_cols
        if x < 0.5
            x = 2 * x;
            y = y / 2;
        else
            x = 2 * x - 1;
            y = (y / 2) + 0.5;
        end
        row_values = [row_values, x + y]; 
    end
    key_stream = [key_stream; row_values]; 
end

fileID = fopen('bakerkey_2d.txt', 'w');
for i = 1:num_rows
    fprintf(fileID, '%f ', key_stream(i, 1:end-1)); 
    fprintf(fileID, '%f\n', key_stream(i, end)); 
end
fclose(fileID);
disp('2D Key Stream has been generated and saved as bakerkey_2d.txt.');

t = toc;            
disp(['Time taken for key stream generation: ', num2str(t), ' seconds']);


