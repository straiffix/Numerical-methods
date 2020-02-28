function  [ y] = HeunMethod(a, b, h, x0, y0, func)
N = (b - a)/h;

x_wynik_heun=zeros(1, N);
y_wynik_heun=zeros(1, N);
x_wynik_heun(1)=x0;
y_wynik_heun(1)=y0;

for i=2:N
    x_wynik_heun(i)=x_wynik_heun(i-1) + h;
    F = func((x_wynik_heun(i-1)+0.5*h), (y_wynik_heun(i-1) + 0.5*h*func(x_wynik_heun(i-1), y_wynik_heun(i-1))));
    y_wynik_heun(i)=y_wynik_heun(i-1)+h*F;
end
y = y_wynik_heun;
end