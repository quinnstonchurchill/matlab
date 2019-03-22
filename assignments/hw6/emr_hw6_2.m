clc; clear; 
d = input('Enter your six dice:');
chance = sum(d); 
three_pair = 0;
small_straight = 0;
large_straight = 0;
maxi_yhatzi = 0;
y = [];

for i = 1:length(d)
    y(i)= sum(d == d(i));
end
if y(i) == 2
    three_pair = 35;
end
if y(i) == 6
    maxi_yhatzi = 100;
end
b = sort(d);
if sum(diff(b) == 1) > 3
    diff2 = diff(find(diff(b) <= 1));
    if diff(1:2) == 1
        small_straight = 40; 
    end 
end 
if sum (diff(b) == 1) == 3
    diff2 = diff(find(diff(b) <= 1)); 
    if diff2(1:3) == 1
        small_straight = 40;
        large_straight = 50;
    end
end
fprintf('Chance is:\t\t\t%d\nThree Pairs is:\t\t%d\n', chance,three_pair);
fprintf('small stright is:\t%d\n', small_straight,large_straight);
fprintf('Maxi Yatzy is: \t\t%d\n', maxi_yhatzi);