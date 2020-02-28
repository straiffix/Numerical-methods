analitical_func = @(x) ( exp(-x)*cos(2*pi*x));
func = @(x, y)(-2*pi*exp(-x)*sin(2*pi*x) - y);

%Zadanie1
a = 0;
b = 10;
h = 0.001;
x0 = 0;
y0 = 1;
N = (b-a)/h;

y_wynik_euler = EulerMethod(a, b, h, x0, y0, func);
y_wynik_heun = HeunMethod(a, b, h, x0, y0, func);
x = linspace(a, b, N );
y_analitical = zeros(1, N);
for i=1:N
    y_analitical(i) = analitical_func(x(i));
end

bledy_euler=abs(y_analitical-y_wynik_euler);
maks_bled_euler=max(bledy_euler)

bledy_heun=abs(y_analitical-y_wynik_heun);
maks_bled_heun=max(bledy_heun)


title("Funkcja:")
xlabel("x");
ylabel("y");
legend();
hold on
grid on
plot(x, y_analitical, '-', 'DisplayName', 'Funkcja analityczna');
plot(x, y_wynik_euler, 'o', 'DisplayName','Rozwiazania metoda Eulera');
plot(x, y_wynik_heun, 'x', 'DisplayName','Rozwiazania metoda Heuena');







