% Modified Vigenere Cipher
message = input('Enter message to decrypt: ', 's');
key = input('Enter secret key: ', 's');

j = 1;
updatedKey = '';
for i = 1:length(message)
    if message(i) <= 'Z' && message(i) >= 'A'
        updatedKey = [updatedKey char(key(j) - 32)];
        j = mod(j, length(key)) + 1;
    elseif message(i) <= 'z' && message(i) >= 'a'
        updatedKey = [updatedKey char(key(j))];
        j = mod(j, length(key)) + 1;
    else
        updatedKey = [updatedKey message(i)];
    end
end

decrypted = message;
j = 1;
for i = 1:length(message)
    if message(i) >= 'a' && message(i) <= 'z'
        decrypted(i) = decrypted(i) - char(key(j) - 'a');
        if decrypted(i) < 'a'
            decrypted(i) = decrypted(i) + 26;
        end
        j = mod(j, length(key)) + 1;
    elseif message(i) >= 'A' && message(i) <= 'Z'
        decrypted(i) = decrypted(i) - char(key(j) - 'a');
        if decrypted(i) < 'A'
            decrypted(i) = decrypted(i) + 26;
        end
        j = mod(j, length(key)) + 1;
    end
end

fprintf('Updated key: %s \n', updatedKey);
fprintf('Decrypted message: %s \n', decrypted);