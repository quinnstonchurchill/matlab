clear;clc;
A = input('Enter vector values in []: ');

for i = 1:length(A)
    smallSub = i;
    for j = i + 1:length(A)
        if A(j) < A(smallSub)
            smallSub = j;
        end
    end
    temp = A(i);
    A(i) = A(smallSub);
    A(smallSub) = temp;
end

g = sprintf('%d ', A);
fprintf('\nSorted values: %s\n', g)