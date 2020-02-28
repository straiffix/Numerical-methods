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
xt0 = t0^2;
yt0 = 2*t0;



%v=y
[x_euler, y_euler, t_euler] = EulerRownania(t0, tlast, h, xt0, yt0, func1, func2);
[x_heun, y_heun, t_heun] = HeunRownania(t0, tlast, h, xt0, yt0, func1, func2);

N = length(t0:h:tlast);
x = zeros(1, N);
for i=1:N
    x(i)=analitical_function(t_euler(i));
end

y = zeros(1, N);
for i=1:N
    y(i)=anfunct(t_euler(i));
end


% bledy_euler=abs(x-x_euler);
% maks_bled_euler=max(bledy_euler)
% 
% bledy_heun=abs(x-x_heun);
% maks_bled_heun=max(bledy_heun)




subplot(6, 2, 1)
title("B??dy Eulera dla h=0.001")
xlabel("x");
ylabel("y");
legend();
hold on
grid on
% plot(t_euler, x, '-', 'DisplayName', 'Funkcja analityczna sin(t^2)');
bledy_eulerx1=abs(y-y_euler);
plot(t_euler, bledy_eulerx1, 'x', 'DisplayName','B??dy metody Eulera x ');
maks_bled_euler1=max(bledy_eulerx1)



subplot(6, 2, 2)
title("B??dy metody Heuna dla h=0.001")
xlabel("x");
ylabel("y");
legend();
hold on
grid on
bledy_heunx1=abs(y-y_heun);
plot(t_euler, bledy_heunx1, 'x', 'DisplayName','B??dy metody Heuna x ');
maks_bled_heun1=max(bledy_heunx1)


subplot(6, 2, 3)
h=0.0001;
[x_euler2, y_euler2, t_euler2] = EulerRownania(t0, tlast, 0.0001, xt0, yt0, func1, func2);
[x_heun2, y_heun2, t_heun2] = HeunRownania(t0, tlast, 0.0001, xt0, yt0, func1, func2);
N = length(t0:h:tlast);
x2 = zeros(1, N);
for i=1:N
    x2(i)=analitical_function(t_euler2(i));
end
title("B??dy Eulera dla h=0.0001")
xlabel("x");
ylabel("y");
legend();
hold on
grid on
% plot(t_euler, x, '-', 'DisplayName', 'Funkcja analityczna sin(t^2)');
bledy_eulerx2=abs(x2-x_euler2);
plot(t_euler2, bledy_eulerx2, 'x', 'DisplayName','B??dy metody Eulera x ');
maks_bled_euler2=max(bledy_eulerx2)



subplot(6, 2, 4)
title("B??dy metody Heuna dla h=0.0001")
xlabel("x");
ylabel("y");
legend();
hold on
grid on
bledy_heunx2=abs(x2-x_heun2);
plot(t_euler2, bledy_heunx2, 'x', 'DisplayName','B??dy metody Heuna x ');
maks_bled_heun2=max(bledy_heunx2)


subplot(6, 2, 5)
h=0.00001;
[x_euler3, y_euler3, t_euler3] = EulerRownania(t0, tlast, 0.00001, xt0, yt0, func1, func2);
[x_heun3, y_heun3, t_heun3] = HeunRownania(t0, tlast, 0.00001, xt0, yt0, func1, func2);
N = length(t0:h:tlast);
x3 = zeros(1, N);
for i=1:N
    x3(i)=analitical_function(t_euler3(i));
end
title("B??dy Eulera dla h=0.00001")
xlabel("x");
ylabel("y");
legend();
hold on
grid on
% plot(t_euler, x, '-', 'DisplayName', 'Funkcja analityczna sin(t^2)');
bledy_eulerx3=abs(x3-x_euler3);
plot(t_euler3, bledy_eulerx3, 'x', 'DisplayName','B??dy metody Eulera x ');
maks_bled_euler3=max(bledy_eulerx3)


subplot(6, 2, 6)
title("B??dy metody Heuna dla h=0.00001")
xlabel("x");
ylabel("y");
legend();
hold on
grid on
bledy_heunx3=abs(x3-x_heun3);
plot(t_euler3, bledy_heunx3, 'x', 'DisplayName','B??dy metody Heuna x ');
maks_bled_heun3=max(bledy_heunx3)



% [x_euler, y_euler, t_euler] = EulerRownania(t0, tlast, h, xt0, yt0, func1, func2);
% [x_heun, y_heun, t_heun] = HeunRownania(t0, tlast, h, xt0, yt0, func1, func2);
% bledy_euler=abs(x-x_euler);
% maks_bled_euler=max(bledy_euler)
% 
% bledy_heun=abs(x-x_heun);
% maks_bled_heun=max(bledy_heun)
