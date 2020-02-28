function  [x, y, t_wynik] = HeunRownania(t0, tlast, h, tx0, ty0, func1, func2)
N = length(t0:h:tlast);

x_wynik_heun=zeros(1, N);
y_wynik_heun=zeros(1, N);
x_wynik_heun(1)=tx0;
y_wynik_heun(1)=ty0;

t = zeros(1, N);
t(1) = t0;

for i=2:N
    xi = x_wynik_heun(i-1);
    yi = y_wynik_heun(i-1);
    ti = t(i-1);
    
    Fx = (func1(xi, yi, ti) + func1(xi+h, yi+h*func1(xi, yi, ti), ti+h))/2;
    Fy = (func2(xi, yi, ti) + func2(xi+h, yi+h*func2(xi, yi, ti), ti+h))/2;
    
    
    x_wynik_heun(i)=xi + h*Fx;
    y_wynik_heun(i)=yi + h*Fy;
    t(i)=ti+h;
end
x = x_wynik_heun;
y = y_wynik_heun;
t_wynik = t;
end