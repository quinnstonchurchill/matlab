function [ binaryImage, centroidX, centroidY ] = ijh3_HW6( filename )
  % -------------------------------------------------------------------------
  % HW6 Solution Key 
  % -------------------------------------------------------------------------
  
  % Load the image given in the function inputs
  pixels = imread(filename);
  
  % Get the image dimensions
  [rows, cols, pages] = size(pixels);
  
  % Display original image
  figure(1)
  imshow(pixels);
  
  % Use vectorization to find the pixels that match purple
  redMatch = pixels(:,:,1) >= 200 & pixels(:,:,1) <= 235;
  greenMatch = pixels(:,:,2) >= 40 & pixels(:,:,2) <= 60;
  blueMatch = pixels(:,:,3) >= 190 & pixels(:,:,3) <= 225;
  
  % Use the single ampersand to combine all 3 pages. Only the good pixels
  % will have a true for red, green, and blue
  binaryImage = redMatch & greenMatch & blueMatch;
  
  % Display the binary image
  figure(2)
  imshow(binaryImage)
  
  % Method 1
  % Use double for loops to search through the binary for 1s
  % Use a running sum to keep track of the rows, cols, and count
  rowTotal = 0; 
  colTotal = 0;
  count = 0;
  for ii = 1:rows
     for jj = 1:cols
        if binaryImage(ii,jj) == 1
           rowTotal = rowTotal + ii;
           colTotal = colTotal + jj;
           count = count+1;
        end
     end
  end
  centroidY = rowTotal/count;
  centroidX = colTotal/count;
  
  % Method 2
  % We can use the find command to vectorize centroid finding
  % find will return all the rows/columns for each pixel that is 
  % equal to 1 (true). The centroid is then just the average of 
  % the rows and columns
  % [goodRows,goodCols] = find(binaryImage == 1);
  % centroidY = mean(goodRows);
  % centroidX = mean(goodCols);
  
  % Display the answer to screen
  fprintf('Purple duck located at: %f, %f \n',centroidX,centroidY)
  
  % Bonus: Draw a circle around the purple duck
  figure(3)
  imshow(pixels)
  width = 10;
  rectangle('Position',[centroidX-width/2,centroidY-width/2,width,width],'Curvature',[1 1],'EdgeColor','y','LineWidth',3);
  
  end
  
  
  