clear;clc;
guess = input('Enter a value to check: ');

% don't allow negative numbers
if (guess < 0)
    fprintf('%d is a negative number and can''t be in the Fibonacci sequence!\n', guess)
else
    first = 0; second = 1; nextNumber = 0;
    % create next fib number until it matches the guess or is greater than guess
    while (nextNumber < guess)
        nextNumber = first+second;
        first = second;
        second = nextNumber;
    end
    % check if guess is correct
    if (nextNumber == guess)
        fprintf('%d is a Fibonacci number! \n',guess);
    % show closest numbers
    else
        fprintf('%d is not a Fibonacci number, try %d or %d \n', guess, first, second);
    end
end