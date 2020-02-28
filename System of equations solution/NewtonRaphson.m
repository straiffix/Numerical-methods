function [miejsce_zerowe, bledy] = NewtonRaphson(f, df,  x0, stop, eps)
%Nie traktuje x0 jako rozwiazanie
dzetta = x0 - f(x0)/df(x0);
i = 1;

bledy = zeros(1, 1);
bledy(1) = abs(f(dzetta));

while(i < stop) && (abs(f(dzetta)) > eps)
    dzetta = dzetta - f(dzetta)/df(dzetta);
    i = i + 1;
    bledy = [bledy, abs(f(dzetta))];
end

miejsce_zerowe = dzetta;
i

end