clear;
filename = input('Enter filename: ', 's');
image = imread(filename);

[height, radius, color] = size(image);

redMatch = image(:,:,1) >= 20 & image(:,:,1) <= 80;
greenMatch = image(:,:,2) >= 50 & image(:,:,2) <= 100;
blueMatch = image(:,:,3) >= 130 & image(:,:,3) <= 255;

binaryImage = redMatch & greenMatch & blueMatch;

[goodRows, goodCols] = find(binaryImage == 1);
centroidY = mean(goodRows);
centroidX = mean(goodCols);

radius = 50;

finalImage = insertShape(image, 'circle', [centroidX centroidY radius], 'LineWidth', 3, 'Color', 'Red');
% figure(1)
% imshow(finalImage)

newFilename = [filename(1:end-4) 'Outline.png'];
imwrite(finalImage, [filename(1:end-4) 'Outline.png']);
fprintf('Outline saved to %s \n', newFilename);