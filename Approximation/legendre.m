s = [0 0; 0.5 0.19; 1 0.26; 1.5 0.29; 2 0.31];


[m, l]= size(s);
m = m-1; %Liczba danych punktow -1 
n = 2; %Stopien wielomianu
a = 0;
b = 2;


A = ones(n+1, n+1); %Rozmiar macierz n x n, gdize n to stopien wielomianu
for i=1:n+1 %Robie macierz A
    for j = 1:n+1 
        A(i, j) = legendreA(i, j, m, s); 
        %Kazda komorka macierzy - suma (x_0...x_m) iloczyn?w wielomainow stopnia i i j, gdzie
        % i to wierszy i j to kolumny
     end
end

B = ones(n+1, 1);
for i = 1:n+1 %Robie macierz B
    sm = 0; 
    for k=1:m+1
        pr = s(k,2)*legendreP(i-1, s(k, 1)); %Kazda komorka macierzy B to suma iloczynu y (y_0...y_m) i funkcji bazowej stopnia i 
    	sm = sm + pr;
        
    end
    B(i)=sm;
end

Xa = A\B; %Obliczam wspolczynniki a
nx = 100;
x = linspace(a, b, nx);


%Opracowanie wynikow
y = ones(nx,1);
for i=1:(nx)
    y(i) = funkcjaAproksymujaca(x(i), n, Xa, a, b);
end

ytext = funkcjaAproksymujaca(s(2, 1), n, Xa, a, b)


%Dane punkty
xx = ones(m+1, 1);
yy = ones(m+1, 1);
for i=1:m+1
    xx(i) = s(i, 1);
    yy(i) = s(i, 2);
end

blad = bladSredniokwadratowy(s, Xa, n, m, a, b);
sprintf("%f", blad)

plot(x, y, 'r', xx, yy, 'p');

%Wzory

function tij = legendreA(i, j, m, s) %Funkcja obliczenia wartosci komorek 
%macierzy A z wykorzystywaniem wielomianow Czebyszewa(Suma(0...k) Ti(x_k)*Tj(x_k)
tij = 0;
    for k=1:m+1
        x = s(k, 1);
        pr = legendreP( i-1, x) * legendreP(j-1, x);
        tij = tij + pr;
    end

end


function wynik = legendreP(k,x)
%   oblicza P_k(x)
    if k == 0
      wynik=1;
    elseif k ==1
     wynik = x;
    else
      wynik = ((2*k-1)*x*legendreP(k-1,x) - (k-1)*legendreP(k-2,x))/k;
    end
end

function y = funkcjaAproksymujaca(x, n, Xa, a, b)
    yn = 0;
    for k=0:n
     %a2 * x^2 + ...
     smm= Xa(k+1)*legendreP(k, x); %Funkcja aproksymujaca a0  *To(x) + a1 * T1(x) + a2 * T2(x) + ....
     yn = yn + smm;
    end
    y=yn;
end


function y = bladSredniokwadratowy(s, Xa, n, m, a, b)
    y = 0;
   for i=1:m+1
    yn = 0;
    %for k=0:n
     %smm = Xa(k+1)*(s(i, 1)^k); %Funkcja aproksymujaca a0 * x^0 + a1 * x^1 +
     %a2 * x^2 + ...
     %smm= Xa(k+1)*czeb(s(i,1), k, a, b);
     smm = funkcjaAproksymujaca(s(i,1), n, Xa, a, b);
     %Funkcja aproksymujaca a0  *To(x) + a1 * T1(x) + a2 * T2(x) + ....
     %yn = yn + smm;
    %end
    yn = (smm - s(i, 2))^2;
    y = y + yn;
   end
end

        
        