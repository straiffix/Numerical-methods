function [x, y, t] = AdamsBashforth(t0, tlast, h, tx0, ty0, func1, func2, step)
N = length(0:h:tlast);
[xel, yel, tel] = EulerRownania(t0, tlast, h, tx0, ty0, func1, func2);

x_wynik_abf=zeros(1, N);
y_wynik_abf=zeros(1, N);
t = zeros(1, N);

for i=1:step
    x_wynik_abf(i)=xel(i);
    y_wynik_abf(i)=yel(i);
    t(i)=tel(i);
end

if step == 2 
    
    for i=3:N
        xi = x_wynik_abf(i-1);
        xii = x_wynik_abf(i-2);
        
        yi = y_wynik_abf(i-1);
        yii = y_wynik_abf(i-2);
        
        ti = t(i-1);
        tii = t(i-2);
        
        Fx = 3/2*func1(xi, yi, ti) - 1/2*func1(xii, yii, tii);
        Fy = 3/2*func2(xi, yi, ti) - 1/2*func2(xii, yii, tii);
         
        x_wynik_abf(i)=xi + h*Fx;
        y_wynik_abf(i)=yi + h*Fy;
        t(i)=ti+h;
    end
elseif step == 3
    
    for i=4:N
        xi = x_wynik_abf(i-1);
        xii = x_wynik_abf(i-2);
        xiii = x_wynik_abf(i-3);
        
        yi = y_wynik_abf(i-1);
        yii = y_wynik_abf(i-2);
        yiii = y_wynik_abf(i-3);
        
        ti = t(i-1);
        tii = t(i-2);
        tiii = t(i-3);
        
        Fx = 23/12*func1(xi, yi, ti) - 16/12*func1(xii, yii, tii) + 5/12*func1(xiii, yiii, tiii);
        Fy = 23/12*func2(xi, yi, ti) - 16/12*func2(xii, yii, tii) + 5/12*func2(xiii, yiii, tiii);
         
        x_wynik_abf(i)=xi + h*Fx;
        y_wynik_abf(i)=yi + h*Fy;
        t(i)=ti+h;
    end
end
x = x_wynik_abf;
y = y_wynik_abf;
end
    