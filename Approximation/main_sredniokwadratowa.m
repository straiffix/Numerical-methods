%s = [0 0; 0.5 0.19; 1 0.26; 1.5 0.29; 2 0.31];
%s = [2 0.3842; 3 1.1062; 4 2.6291; 5 7.8320; 6 17.379; 7 36.607; 8 66.696;
%9 104.43];
%Dane punkty


[m, l]= size(s);
m = m-1; %Liczba danych punktow -1 
n = 2; %Stopien wielomianu
a = 1;
b = 10;

x_dane = ones(m+1, 1);
y_dane = ones(m+1, 1);
for i=1:m+1
    x_dane(i) = s(i, 1);
    y_dane(i) = s(i, 2);
end


A = ones(n+1, n+1); %Rozmiar macierz n x n, gdize n to stopien wielomianu
for i=1:n+1 %Robie macierz A
    for j = 1:n+1 
        A(i, j) = summ(i, j, m, s); %x^i * x^j
        %Kazda komorka macierzy - suma (x_0...x_m) iloczyn?w wielomainow stopnia i i j, gdzie
        % i to wierszy i j to kolumny
     end
end

B = ones(n+1, 1);
for i = 1:n+1 %Robie macierz B
    sm = 0; 
    for k=1:m+1
        pr = s(k,2)*(s(k,1)^(i-1)); % x^0, x^1, x^2....
        %Kazda komorka macierzy B to suma iloczynu y (y_0...y_m) i funkcji bazowej stopnia i 
    	sm = sm + pr;
    end
    B(i)=sm;
end

Xa = A\B; %Obliczam wspolczynniki a
nx = 1000;
x = linspace(a, b, nx);

%Opracowanie wynikow
y = ones(nx,1);
for i=1:(nx)
    y(i) = funkcjaAproksymujaca(x(i), n, Xa);
end

bl = bladbezwzgledny(x_dane, y_dane, n, Xa, m);

blad = bladSredniokwadratowy(x_dane, y_dane, Xa, n, m);
sprintf("%f", blad)

plot(x, y, 'r', x_dane, y_dane, 'p');

%Wzory
       
function ij = summ(i, j, m, x_dane) %Funkcja obliczenia wartosci komorek macierzy A do zwyklej aproksymacji sredniokwaratowej wielomianowej
ij = 0;
    for k=1:m+1
        pr = (x_dane(k)^(i-1))*(x_dane(k)^(j-1)); %Suma 0..k x_k^i * x_k^j
        ij = ij + pr;
    end
end


function ytxt = bladbezwzgledny( x_dane, y_dane, n, Xa, m)
 ytxt = 0;
 
 for i=1:m+1
     blad = y_dane(i) - funkcjaAproksymujaca(x_dane(i), n, Xa);
     blad = abs(blad);
     if blad > ytxt
         ytxt = blad;
     end
 end
end

function y = funkcjaAproksymujaca(x, n, Xa)
    yn = 0;
    for k=0:n
     smm = Xa(k+1)*(x^k); %Funkcja aproksymujaca a0 * x^0 + a1 * x^1 +
     %a2 * x^2 + ...
     yn = yn + smm;
    end
    y=yn;
end



function y = bladSredniokwadratowy(x_dane, y_dane, Xa, n, m)
    y = 0;
   for i=1:m+1
    yn = 0;
   % for k=0:n
     %smm = Xa(k+1)*(s(i, 1)^k) %Funkcja aproksymujaca a0 * x^0 + a1 * x^1 +
     %a2 * x^2 + ...
    smm = funkcjaAproksymujaca(x_dane(i), n, Xa);
    %yn = yn + smm;
    %end
    yn = (smm - y_dane(i))^2;
    y = y + yn;
   end
end

        
        