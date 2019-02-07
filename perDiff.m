function x = perDiff(a,b)
    x = abs(a - b)/mean([a b])*100;
end