


function [answ] = prostyNewtonCotes(f, h)
[n, m] = size(f);
answ = 0;
if m > 5 
    answ =  NaN; 
end
if m == 1
    answ =  h * f(1);
end
if m == 2
    answ = (h/2) * (f(1) + f(2));
end
if m == 3
    answ = (h / 3) * (f(1) + 4 * f(2) + f(3)); 
end
if m == 4
    answ = (3*h/8) * (f(1) + 3 * f(2) + 3 * f(3) + f(4));
end
if m == 5
    answ = (2*h/45) * (7 * f(1) + 32 * f(2) + 12 * f(3) + 32 * f(4) + 7 * f(5));
end
end