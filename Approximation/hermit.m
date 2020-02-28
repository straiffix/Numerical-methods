s = [0 0; 0.5 0.19; 1 0.26; 1.5 0.29; 2 0.31];
%s = [2 0.3842; 3 1.1062; 4 2.6291; 5 7.8320; 6 17.379; 7 36.607; 8 66.696;
%9 104.43];


[m, l]= size(s);
m = m-1; %Liczba danych punktow -1 
n = 2; %Stopien wielomianu
a = 0;
b = 2;


A = ones(n+1, n+1); %Rozmiar macierz n x n, gdize n to stopien wielomianu
for i=1:n+1 %Robie macierz A
    for j = 1:n+1 
        A(i, j) = HermitA(i, j, m, s); %x^i * x^j
        %Kazda komorka macierzy - suma (x_0...x_m) iloczyn?w wielomainow stopnia i i j, gdzie
        % i to wierszy i j to kolumny
     end
end

B = ones(n+1, 1);
for i = 1:n+1 %Robie macierz B
    sm = 0; 
    for k=1:m+1
        pr = s(k,2)*Hermit(s(k, 1), i-1); % x^0, x^1, x^2....
        %Kazda komorka macierzy B to suma iloczynu y (y_0...y_m) i funkcji bazowej stopnia i 
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
    y(i) = funkcjaAproksymujaca(x(i), n, Xa);
end

ytext = funkcjaAproksymujaca(s(2, 1), n, Xa)

%Dane punkty
xx = ones(m+1, 1);
yy = ones(m+1, 1);
for i=1:m+1
    xx(i) = s(i, 1);
    yy(i) = s(i, 2);
end

blad = bladSredniokwadratowy(s, Xa, n, m);
sprintf("%f", blad)

plot(x, y, 'r', xx, yy, 'p');

%Wzory
 


function hij = HermitA(i, j, m, s) %Funkcja obliczenia wartosci komorek 
%macierzy A z wykorzystywaniem wielomianow Czebyszewa(Suma(0...k) Ti(x_k)*Tj(x_k)
hij = 0;
    for k=1:m+1
        x = s(k, 1);
        pr = Hermit(x, i-1) * Hermit(x, j-1);
        hij = hij + pr;
    end

end

function y = Hermit(x, n)
    if n == 0
        y = 1;
    elseif n == 1
        y = 2 * x;
    else
        y = 2 * x * Hermit(x, n-1) - 2 * (n-1) * Hermit(x, n-2);
    end
end

function ij = summ(i, j, m, s) %Funkcja obliczenia wartosci komorek macierzy A do zwyklej aproksymacji sredniokwaratowej wielomianowej
ij = 0;
    for k=1:m+1
        pr = (s(k,1)^(i-1))*(s(k,1)^(j-1)); %Suma 0..k x_k^i * x_k^j
        ij = ij + pr;
    end
end


function y = funkcjaAproksymujaca(x, n, Xa)
    yn = 0;
    for k=0:n
     %a2 * x^2 + ...
     smm= Xa(k+1).*Hermit(x, k); %Funkcja aproksymujaca a0  *To(x) + a1 * T1(x) + a2 * T2(x) + ....
     yn = yn + smm;
    end
    y=yn;
end


function y = bladSredniokwadratowy(s, Xa, n, m)
    y = 0;
   for i=1:m+1
    yn = 0;
    %for k=0:n
     %smm = Xa(k+1)*(s(i, 1)^k) %Funkcja aproksymujaca a0 * x^0 + a1 * x^1 +
     %a2 * x^2 + ...
     smm = funkcjaAproksymujaca(s(i,1), n, Xa);
     %yn = yn + smm;
   % end
    yn = (smm - s(i, 2))^2;
    y = y + yn;
   end
end

        
        