


a = -1;
b = 1;
ile = 201;

h = 0.01;

x = linspace(a, b, ile);
y = ones(1, ile);
for i=1:(ile)
    y(i) = 11 * (x(i)^10);
end



answ = zlozonyNewtonCotes(y, h, 4)





