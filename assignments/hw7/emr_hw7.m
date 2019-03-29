function [secretMessage] = ijh3_HW4(encodedMessage, key)
% -------------------------------------------------------------------------
% HW4 Solution Key 
% -------------------------------------------------------------------------

    % Adjust the key length so it is the same length as the encodedMessage
    % Method 1
    keyLength = length(key);
    for  ii = keyLength:length(encodedMessage)-1
        offset = mod(ii,keyLength)+1;
        key = [key key(offset)];
    end
     
    % Method 2
%     keyLength = length(key);
%     for ii = 1:length(encodedMessage)-keyLength
%        key = [key key(ii)];
%     end
    
    % Vigenere table given to students
    vigenere = char(zeros(26,26));
    letter = 'A';
    for ii = 1:26
        for jj = 1:26
            vigenere(ii,jj) = letter;
            letter = letter + 1;
            if letter > 90
                letter = 65;
            end
        end
        letter = letter + 1;
    end

    % Pre-allocate space for the answer, blanks is like the zeros,ones
    % command except for empty spaces
    decrypted = blanks(length(encodedMessage));
    
    % Decode each letter in the encodedMessage by finding its spot
    % in the Vigenere table
    for ii = 1:length(encodedMessage)
            % 64 trick
            row = vigenere(key(ii)-64,:);
            
            % Method 1
            for jj = 1:26
                if encodedMessage(ii) == row(jj)
                    decrypted(ii) = jj+64;
                    break;
                end
            end
            
            % Method 2 with Vectorization          
%             secretLetter = find(row == encodedMessage(ii),1);
%             decrypted(ii) = secretLetter+64;
    end
    
    % Display answer
    fprintf('Encrypted message: %s \n',encodedMessage);
    fprintf('Decrypted message: %s \n',decrypted);
    
    % Set the function output to the answer
    secretMessage = decrypted;
end
