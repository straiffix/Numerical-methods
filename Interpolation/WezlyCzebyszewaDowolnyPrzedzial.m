function outputArg1 = WezlyCzebyszewaDowolnyPrzedzial(k, stopienWielomianu, a,b)
%   zwraca k-ty wêze³ czebyszewa w przedziale [a;b]
%   k = 1,....,n

outputArg1 = 0.5*(a+b) + 0.5*(b-a)*WezlyCzebyszewa(k,stopienWielomianu);
end
