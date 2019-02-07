clear;
% coefficients
coeff3 = input('Enter x^3 coeff: ');
coeff2 = input('Enter x^2 coeff: ');
coeff1 = input('Enter x^1 coeff: ');
coeff0 = input('Enter x^0 coeff: ');

% check if polynomial has roots
if coeff3 == 0 && coeff2 == 0 && coeff1 == 0
    disp('Improper polynomial; no possible roots.')
else
    % variables
    guess = input('Enter initial guess: ');
    nextGuess = 0;
    solution = NaN;
    tolerance = 1e-9;
    coeffs = [coeff3 coeff2 coeff1 coeff0];
    polynomialOrder = length(coeffs) - 1;
    
    % find derivative
    derivative = zeros(1, polynomialOrder - 1);
    for i = 1:polynomialOrder
        derivative(i) = (coeffs(i) * (polynomialOrder - (i - 1)));
    end
    
    % The main loop to calculate Newton's Method
    for iterations = 1:5000
        % Calculate y and y' based on the current guess
        y = polyval(coeffs, guess);
        y_prime = polyval(derivative, guess);
    
        % Newton's method
        nextGuess = guess - y / y_prime;
        % check if solution
        if (abs(nextGuess-guess) / abs(nextGuess) < tolerance)
            fprintf('Found root of %.3f in %d iterations\n', nextGuess, iterations);
            % pass the solution to the calling process
            solution = nextGuess;
            break;
        elseif iterations == 5000
            disp('Solution not found in 5000 iterations.');
            break;
        else
            % update iteration and guess
            iterations = iterations + 1;
            guess = nextGuess;
        end
    end
end
