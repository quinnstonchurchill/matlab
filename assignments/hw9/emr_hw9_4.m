image = uint8(zeros(501, 1001, 3));

for i = 1:501
    for j = i:(1001 - (i - 1))
        image(i,j,:) = uint8([255, 255, 255]);
    end
end

imshow(image)