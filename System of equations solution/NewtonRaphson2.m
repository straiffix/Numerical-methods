function [miejsce_zerowe, bledy] = NewtonRaphson2(f, df, ddf, x0, stop, eps)

    dzetta1 = x0 - (f(x0) + sqrt(df(x0)^2 - 2*f(x0)*ddf(x0)))/ddf(x0);
    f1 = abs(f(dzetta1));
    dzetta2 = x0 - (f(x0) - sqrt(df(x0)^2 - 2*f(x0)*ddf(x0)))/ddf(x0);
    f2 = abs(f(dzetta2));
    if f1 < f2
        dzetta = dzetta1;
    else
        dzetta = dzetta2;
    end
    
    bledy = zeros(1, 1);
    bledy(1) = abs(f(dzetta));
    i = 1;
    
    while(i < stop) && (abs(f(dzetta)) > eps)
        dzetta1 = dzetta - (f(dzetta) + sqrt(df(dzetta)^2 - 2*f(dzetta)*ddf(dzetta)))/ddf(dzetta);
        f1 = abs(f(dzetta1));
        dzetta2 = dzetta - (f(dzetta) - sqrt(df(dzetta)^2 - 2*f(dzetta)*ddf(dzetta)))/ddf(dzetta);
    	f2 = abs(f(dzetta2));
        if f1 < f2
            dzetta = dzetta1;
        else
            dzetta = dzetta2;
        end
        i = i + 1;
        bledy = [bledy, abs(f(dzetta))];
    end

    miejsce_zerowe = dzetta;
    
end