%ewentualnie doda? 2 funkcje
function  [x, y, t_wynik] = EulerRownania(t0, tlast, h, tx0, ty0, func1, func2)
N = length(t0:h:tlast);
%func = @(x, y)(-2*pi*exp(-x)*sin(2*pi*x) - y);

x_wynik_euler=zeros(1, N);
y_wynik_euler=zeros(1, N);
t = zeros(1, N);
x_wynik_euler(1)=tx0;
y_wynik_euler(1)=ty0;
t(1) = t0;

for i=2:N
    x_wynik_euler(i)=x_wynik_euler(i-1) + h*func1(x_wynik_euler(i-1), y_wynik_euler(i-1), t(i-1));
    y_wynik_euler(i)=y_wynik_euler(i-1) + h*func2(x_wynik_euler(i-1), y_wynik_euler(i-1), t(i-1));
    t(i)=t(i-1)+h;
end
x = x_wynik_euler;
y = y_wynik_euler;
t_wynik = t; 
end

