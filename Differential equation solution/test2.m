% func1 = @(x, y, t)(y);
% func2 = @(x, y, t)(-x);
% 
% analitical_function = @(t)(sin(t));
% 
% 
% t0 = 0;
% tlast = 10;
% h = 0.001;
% N = length(t0:h:tlast);
% xt0 = 0;
% yt0 = 1;


func1 = @(x, y, t)(y);
func2 = @(x, y, t)(y/t - 4*t^2*x);

analitical_function = @(t)(sin(t^2));
anfunct = @(t)(2*t*cos(t^2));


t0 = 0.001;
tlast = 10;
h = 0.001;
N = length(t0:h:tlast);
xt0 = t0^2;
yt0 = 2*t0;



%v=y
[x_euler, y_euler, t_euler] = EulerRownania(t0, tlast, h, xt0, yt0, func1, func2);
[x_heun, y_heun, t_heun] = HeunRownania(t0, tlast, h, xt0, yt0, func1, func2);

x = zeros(1, N);
for i=1:N
    x(i)=analitical_function(t_euler(i));
end

y = zeros(1, N);
for i=1:N
    y(i)=anfunct(t_euler(i));
end


bledy_euler=abs(x-x_euler);
maks_bled_euler=max(bledy_euler)

bledy_heun=abs(x-x_heun);
maks_bled_heun=max(bledy_heun)




subplot(6, 2, 1)
title("Rozwi?zanie metod? Eulera dla h=0.001")
xlabel("x");
ylabel("y");
legend();
hold on
grid on
% plot(t_euler, x, '-', 'DisplayName', 'Funkcja analityczna sin(t^2)');
plot(t_euler, x_euler, 'o', 'DisplayName','Rozwiazania metoda Eulera x ');
% plot(t_euler, y, '-', 'DisplayName', 'Funkcja analityczna 2*t*cos(t^2)');
plot(t_heun, y_euler, 'x', 'DisplayName','Rozwiazania metoda Eulera y');


subplot(6, 2, 2)
title("Funkcja: Rozwi?zanie metod? Heuna dla h=0.001")
xlabel("x");
ylabel("y");
legend();
hold on
grid on
% plot(t_euler, x, '-', 'DisplayName', 'Funkcja analityczna sin(t^2)');
plot(t_euler, x_heun, 'o', 'DisplayName','Rozwiazania metoda Heuna x');
% plot(t_euler, y, '-', 'DisplayName', 'Funkcja analityczna 2*t*cos(t^2)');
plot(t_heun, y_heun, 'x', 'DisplayName','Rozwiazania metoda Heuena y');

subplot(6, 2, 3)
[x_euler, y_euler, t_euler] = EulerRownania(t0, tlast, 0.0001, xt0, yt0, func1, func2);
[x_heun, y_heun, t_heun] = HeunRownania(t0, tlast, 0.0001, xt0, yt0, func1, func2);
title("Rozwi?zanie metod? Eulera dla h=0.0001")
xlabel("x");
ylabel("y");
legend();
hold on
grid on
% plot(t_euler, x, '-', 'DisplayName', 'Funkcja analityczna sin(t^2)');
plot(t_euler, x_euler, 'o', 'DisplayName','Rozwiazania metoda Eulera x');
% plot(t_euler, y, '-', 'DisplayName', 'Funkcja analityczna 2*t*cos(t^2)');
plot(t_heun, y_euler, 'x', 'DisplayName','Rozwiazania metoda Eulera y');


subplot(6, 2, 4)
title("Rozwi?zanie metod? Eulera dla h=0.0001")
xlabel("x");
ylabel("y");
legend();
hold on
grid on
% plot(t_euler, x, '-', 'DisplayName', 'Funkcja analityczna sin(t^2)');
plot(t_euler, x_heun, 'o', 'DisplayName','Rozwiazania metoda Heuna x');
% plot(t_euler, y, '-', 'DisplayName', 'Funkcja analityczna 2*t*cos(t^2)');
plot(t_heun, y_heun, 'x', 'DisplayName','Rozwiazania metoda Heuena y');


subplot(6, 2, 5)
[x_euler, y_euler, t_euler] = EulerRownania(t0, tlast, 0.00001, xt0, yt0, func1, func2);
[x_heun, y_heun, t_heun] = HeunRownania(t0, tlast, 0.00001, xt0, yt0, func1, func2);
title("Rozwi?zanie metod? Eulera dla h=0.00001")
xlabel("x");
ylabel("y");
legend();
hold on
grid on
% plot(t_euler, x, '-', 'DisplayName', 'Funkcja analityczna sin(t^2)');
plot(t_euler, x_euler, 'o', 'DisplayName','Rozwiazania metoda Eulera x');
% plot(t_euler, y, '-', 'DisplayName', 'Funkcja analityczna 2*t*cos(t^2)');
plot(t_heun, y_euler, 'x', 'DisplayName','Rozwiazania metoda Eulera y');

subplot(6, 2, 6)
title("Rozwi?zanie metod? Heuna dla h=0.00001")
xlabel("x");
ylabel("y");
legend();
hold on
grid on
% plot(t_euler, x, '-', 'DisplayName', 'Funkcja analityczna sin(t^2)');
plot(t_euler, x_heun, 'o', 'DisplayName','Rozwiazania metoda Heuna x');
% plot(t_euler, y, '-', 'DisplayName', 'Funkcja analityczna 2*t*cos(t^2)');
plot(t_heun, y_heun, 'x', 'DisplayName','Rozwiazania metoda Heuena y');





[x_euler, y_euler, t_euler] = EulerRownania(t0, tlast, h, xt0, yt0, func1, func2);
[x_heun, y_heun, t_heun] = HeunRownania(t0, tlast, h, xt0, yt0, func1, func2);
bledy_euler=abs(x-x_euler);
maks_bled_euler=max(bledy_euler)

bledy_heun=abs(x-x_heun);
maks_bled_heun=max(bledy_heun)
