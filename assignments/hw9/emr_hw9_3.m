clear;clc;
% msg = input('Enter a secret message: ', 's');
msg = 'hello human!';
encrypted = msg;

a = uint8('a');
z = uint8('z');

for i = 1:length(msg)
    msgInt = uint8(msg(i));
    if (a <= msgInt && msgInt <= z)
        j = a + z - msgInt;
        encrypted(i) = char(j);
    elseif msgInt < a
        encrypted(i + 1) = char(msgInt);
    end
end