% Lowest multiple with 9s and 0s
clc; clear;
N = input('Enter a positive whole number N: '); % N should be stored as a number, not a string
cnt = 1;
while true
    M = N*cnt;
    while M >= 1
        remainder = mod(M,10); % Should divide M by 10, not the other way around
        if remainder == 9 || remainder == 0 % Check if remainder equals 9 or 0, ~= 
            M = floor(M / 10); % divide M by 10, not multiply
        else
            break; % should break out of inner while loop to check if M < 1 and update cnt
        end
    end
    if M < 1
        break;
    end
    cnt = cnt + 1; % wrong syntax for updating cnt
end
fprintf('Lowest multiple with only 9s and 0s: %d\n',N*cnt) % lowest multiple should be N * cnt