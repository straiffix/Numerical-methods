func1 = @(x, y, t)(y);
func2 = @(x, y, t)(y/t - 4*t^2*x);
analitical_function = @(x)(sin(x^2));
%Wielokrokowa i ogolny wzor

t0 = 1e-3;
tlast = 10;
h = 0.001;
N = length(0:h:tlast);
xt0 = t0^2;
yt0 = 2*t0;


[x_abf, y_abf, t_abf] = AdamsBashforth(t0, tlast, h, xt0, yt0, func1, func2, 2);

x = zeros(1, N);
for i=1:N
    x(i)=analitical_function(t_abf(i));
end


bledy_abf=abs(x-x_abf);
maks_bled_abf=max(bledy_abf)

title("Funkcja:")
xlabel("x");
ylabel("y");
legend();
hold on
grid on

plot(t_abf, x, '-', 'DisplayName', 'Funkcja analityczna');
plot(t_abf, x_abf, 'o', 'DisplayName','Rozwiazania metoda AdamaBashfortha');