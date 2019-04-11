% Swap vowels
clear;
word = input('Enter the word: ', 's');
vowels = 'aeiou';
wordVowels = [];

% make array of vowels
for w = 1:length(word)
    for v = 1:length(vowels)
        if word(w) == vowels(v)
            wordVowels = [wordVowels word(w)];
        end
    end
end

wordVowels = flip(wordVowels);
vowelIndices = regexp(word, '[aeiou]');

for i = 1:length(vowelIndices)
    word(vowelIndices(i)) = wordVowels(i);
end

fprintf('The new word is: %s \n', word);