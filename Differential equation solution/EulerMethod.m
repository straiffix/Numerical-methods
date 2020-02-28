
function [y] = EulerMethod(a, b, h, x0, y0, func)
N = (b - a)/h;
%func = @(x, y)(-2*pi*exp(-x)*sin(2*pi*x) - y);

x_wynik_euler=zeros(1, N);
y_wynik_euler=zeros(1, N);
x_wynik_euler(1)=x0;
y_wynik_euler(1)=y0;

for i=2:N
    x_wynik_euler(i)=x_wynik_euler(i-1) + h;
    y_wynik_euler(i)=y_wynik_euler(i-1) + h*func(x_wynik_euler(i-1), y_wynik_euler(i-1));
end
y = y_wynik_euler;
end


    