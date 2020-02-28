function [answ] = zlozonyNewtonCotes(f, h, maks_rzad)
%Rzad: 0 1 2 3 4 
if maks_rzad > 4
    answ = NaN
    return
end
[n, m] = size(f);
k = [0, 1, 2, 3, 4];
a = 1;
rzad = maks_rzad+1;
if rzad == 1
    k = [1];
end

answ = 0;

while rzad >0
    ff = [];

    if (a + k(rzad)) <= m
        for i=1:rzad
            ff = [ff, f(a+k(i))];
        end
        answ = answ + prostyNewtonCotes(ff, h);
    a = a + k(rzad);
    else 
        while(a + k(rzad) > m)
          rzad = rzad -1;
        end
    end
    if a == m
        rzad = 0;
    end
    
end
end