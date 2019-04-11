function [ pixels ] = ijh3_HW5( imageName )
% Close any open images from a previous program
close all;

% Read in the image
jumbledPixels = imread(imageName);

% Display the image but force MATLAB to use figure 1
figure(1)
imshow(jumbledPixels)

% Get the image dimensions
[rows, cols, page] = size(jumbledPixels);

% Create an empty image of the same size, forcing unsigned 8 bit integers
pixels = uint8(zeros(rows,cols,page));

% Go through all columns of the image and implement algorithm
% For each column, we move all rows and pages to a new column
for y  = 1:cols
    row_and_color = jumbledPixels(:,y,:);
    if mod(y,2) == 0
        pixels(:,y/2,:) = row_and_color;
    else
        pixels(:,(y+1)/2+cols/2,:) = row_and_color;
    end
end

% Use vector notation to edit colors
% We haven't covered this in detail yet in class but we will on Monday.
% Most students will use double for loops, which is great. Please let 
% students do that; we shouldn't confuse them!
pixels(:,:,1) = pixels(:,:,1)*5;
pixels(:,:,3) = pixels(:,:,3)*5;
pixels(:,:,2) = 1;
   
% Display 
figure(2)
imshow(pixels);

end

