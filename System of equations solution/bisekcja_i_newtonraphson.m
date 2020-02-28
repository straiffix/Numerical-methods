f = @(x) (3.55*x^3 - 1.1*x^2 - 0.765*x + 0.74);
df = @(x)((213*x^2)/20 - (11*x)/5 - 153/200);
ddf = @(x)((213*x)/10 - 11/5);


a = -1;
b = 1;
x0 = -1;
stop = 100;
eps = 10^(-8);
eps_a = 0.001;

[mz1, bl1] = bisekcja(f, a, b, stop, eps_a);
[mz2, bl2] = NewtonRaphson(f, df,  mz1, stop, eps);

