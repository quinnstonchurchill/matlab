% make a transfer function
s = tf('s');

% build more complicated transfer function
GH = 1 / (s * (s + 4) * (s^2 + 4*s + 20));

% you can also do it like this
num = 1;
den = [1 8 36 80 0];
GH = tf(num, den);

% or like this with zpk
% GH = 1 / (s * (s + 4) * (s^2 + 4*s + 20));
GH = zpk([], [0, -4, -2 + 4i, -2 - 4i], 1);

% how to find poles and zeros
p = pole(GH);
z = zero(GH);

% can also pass in roots of characteristic polynomial
p = pole([1 8 36 80 0]);

% you can do this visually too
pzmap(GH);

% plot pzmap for the closed loop system as we sweep the gain k from 0 to 10
% plots root locus
for k = 1:10:100
    pzmap(feedback(GH * k, 1))
    hold on
end

% easier way to do it
hold off
rlocus(GH)

% controls toolbox
sisotool(GH);

% stack functions
GH1 = 1 / (s * (s + 4) * (s^2 + 4*s + 20));
GH2 = 1 / (s * (s + 4) * (s^2 + 4*s + 20));
GH3 = 1 / (s * (s + 4) * (s^2 + 4*s + 20));
GH4 = 1 / (s * (s + 4) * (s^2 + 4*s + 20));

GHstacked = stack(1, GH1, GH2, GH3, GH4);