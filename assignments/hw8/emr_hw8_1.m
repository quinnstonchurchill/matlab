% Checkerboard
clear;clc;
size = 64;
rows = 8;
cols = 8;

% black
A = zeros([size size]);
% white
B = ones([size size]);

m = size;
n = 1;
num = 2;

for i = 1:rows
    n1 = 1;
    m1 = size;
    for j = 1:cols
        if mod(num, 2) == 0
            checkerboard(n:m, n1:m1) = A;
        else
            checkerboard(n:m, n1:m1) = B;
        end
        num = num + 1;
        m1 = m1 + size;
        n1 = n1 + size;
    end
    if mod(cols, 2) == 0
        num = num + 1;
    end
    n = n + size;
    m = m + size;
    
end

imshow(checkerboard);
imwrite(checkerboard, 'generatedCheckerboard.png');