% Prime factors of N
clear;
N = input('Enter a positive whole number N: ');
fprintf('Prime factors: ');
factor = 2; % factor of 1 causes line 9 to print indefinitely b/c mod(anyNumber, 1) is always 0
while N > 1 % while loop should end when N = 1
    if mod(N,factor) == 0
        N = N/factor; % each iteration should check if N is divisible by factor
        fprintf('%d ',factor)
    else
        factor = factor+1; % next iteration factor should be greater than the previous one
    end
end
fprintf('\n')
