% Lowest multiple with 9s and 0s
clc; clear;
N = input('Enter a positive whole number N: ','s');
cnt = 1;
while true
    M = N*cnt;
    while M >= 1
        remainder = mod(10,M);
        if remainder ~= 9 || remainder ~= 0
            continue;
        else
            M = floor(M*10);
        end
    end
    if M < 1
        break;
    end
    cnt+1;
end
fprintf('Lowest multiple with only 9s and 0s: %d\n',N)
