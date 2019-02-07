% first we want to define our percent overshoot, PO
PO = 15;
% then we'll calculate zeta (damping ratio) using the eqn
zeta = abs(log(PO/100)) / (sqrt(pi^2 + log(PO/100)^2));

% now I want to define a second order transfer function and since natural
% frequency, w, doesn't impact overshoot, I'm free to choose any value
w = 1; % 1 rad/s

s = tf('s');

% now i can use s to create more complicated transfer functions
secondOrder = w^2/(s^2 + 2*zeta*w*s + w^2);

% now we can see what the step response looks like
step(secondOrder)

%% let's see how natural frequency doesn't really matter for overshoot
for w = 0.5:0.5:2
    secondOrder = w^2/(s^2 + 2*zeta*w*s + w^2);
    step(secondOrder);
    hold all
end

%% let's see how the poles move in the s-plane
close
for w = 0.5:0.5:2
    secondOrder = w^2/(s^2 + 2*zeta*w*s + w^2);
    pzmap(secondOrder)
    hold all
end