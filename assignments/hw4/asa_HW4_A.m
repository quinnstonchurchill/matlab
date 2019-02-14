% Prime factors of N
clc; clear;
N = input('Enter a positive whole number N: ');
fprintf('Prime factors: ');
factor = 1;
while N >= 1
    if mod(N,factor) == 0
        N = N-factor;
        fprintf('%d',factor)
    else
        factor = factor-1;
    end
end
fprintf('\n')
