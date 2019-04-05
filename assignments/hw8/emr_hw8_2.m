% Image puzzles
clear;close all;
filename = input('Enter image name: ', 's');
% filename = 'Cool_Puzzle.png';
jumbledImage = imread(filename);

% get image dimensions
[height, width, rgb] = size(jumbledImage);

image = uint8(zeros(height, width, rgb));

for row = 1:height
    for col = 1:width
        pixel = jumbledImage(row, col, :);
        % even row?
        if mod(row, 2) == 0
            newRow = row / 2;
        else
            newRow = (row + 1) / 2 + (height / 2);
        end
        % left half?
        if col <= width / 2
            newCol = width / 2 + 1 - col;
        else
            newCol = ((3 * width) / 2) + 1 - col;
        end

        image(newRow, newCol, :) = pixel;
    end
end


% fix colors
image(:,:,1) = image(:,:,1) * 3; % red
image(:,:,3) = image(:,:,1) * 3; % blue
image(:,:,2) = 0; % green

% rearrange image
q1 = image(1:height/2, 1:width/2, :);
q2 = image(1:height/2, width/2+1:width, :);
q3 = image(height/2+1:height, 1:width/2, :);
q4 = image(height/2+1:height, width/2+1:width, :);
finalImage = [q3 q1; q4 q2];

% display image
figure(5)
imshow(finalImage)
newFilename = [filename(1:end-10) 'Fixed.png'];
imwrite(finalImage, [filename(1:end-10) 'Fixed.png']);
fprintf('Corrected image saved to %s \n', newFilename);