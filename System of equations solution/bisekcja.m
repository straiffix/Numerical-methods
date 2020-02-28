function [miejsce_zerowe, bledy] = bisekcja(f, x0, a0, stop, eps)
    x = x0;
    a = a0;
    i = 1;
    u = (x + a)/2;
    bledy = zeros(1, 1);
    bledy(1) = abs(f(u));
    
    while (i < stop) && (abs(f(u)) >= eps)
        u = (x + a)/2;
        if (f(u)*f(x) > 0)
            x = u;
        elseif (f(u)*f(x) < 0)
            a = u;
        else
            break;
        end
        i = i + 1;
        bledy = [bledy, abs(f(u))];
    end
    miejsce_zerowe = u;
    bledy = bledy(1, 2:i); 
    
end