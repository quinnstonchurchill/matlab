% Clear screen and any old variables
clc; clear all;
% Ask the user for a value they believe is in the Fibonacci sequence
userValue = input('Please enter a value in the Fibonacci sequence: ');

% If the supplied value is negative, display an error message
if (userValue < 0)
    fprintf('%d is a negative number and can''t be in the Fibonacci sequence!\n',userValue)
else
    % The Fibonacci equation is Fn = Fn-1 + Fn-2
    % The Fibonacci sequence always starts with 0 and 1
    first = 0; second = 1; nextInSequence = 0;
    % Create Fibnoacci numbers until it matches the user's value or 
    % becomes larger than the user's value
    while (nextInSequence < userValue)
        nextInSequence = first+second;
        first = second;
        second = nextInSequence;
    end
    % Was it actually a Fibonacci number?
    if (nextInSequence == userValue)
        fprintf('%d is a Fibonacci number! \n',userValue);
    % If it wasn't, display the values around the user's value    
    else
        fprintf('%d is not a Fibonacci number. \n',userValue);
        fprintf('The valid numbers around %d are %d and %d \n',userValue,first,second);
    end
end