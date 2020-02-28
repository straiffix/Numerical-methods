%A= [1 2 3; 2 8 10; 3 10 22]
%A = [2 1 5 -1.5; 5 3 2 4; -2 3 2 -4; 4.5 3 5 2];
%b = [1.7 47.3 -46.4 34.95];
%b=[1 3 7]
A = [4 -2 2; -2 2 2; 2 2 14];
b = [-6; 4; 0];
%n=3


[n, m] = size(A);

%obliczamy L
L = zeros(n,n);

for k=1:n
    %w=[k,k]
    L(k,k)=lkk(k,L,A);
    for i=k+1:n
       %w=[i,k]
       L(i,k)=lik(i,k,L,A);
    end
end



% obliczamy wynik równania
y=zeros(n, 1);
x=zeros(n, 1);
for i=1:n
    y(i) = yi(i, y,L,b);
end

for i=n:-1:1
    x(i) = xi(i, x,L,y,n);
end


function wynik = lkk(k, tablica_L, tablica_A)
suma=0;
for j=1:k-1
   suma = suma + tablica_L(k,j)*tablica_L(k,j); 
end
wynik = sqrt(tablica_A(k,k)-suma);
end


function wynik = lik(i,k, tablica_L, tablica_A)
suma=0;
for j=1:k-1
   suma = suma + tablica_L(i,j)*tablica_L(k,j); 
end
wynik = tablica_A(i,k)-suma;
wynik = wynik / tablica_L(k,k);
end

function wynik =yi(i, tablica_y, tablica_L, tablica_b)
    suma=0;
    for j=1:i-1
       suma = suma + tablica_L(i,j)*tablica_y(j); 
    end
    wynik = (tablica_b(i)-suma)/tablica_L(i,i);
end


function wynik =xi(i, tablica_x, tablica_L, tablica_y,n)
    suma=0;
    for j=i+1:n
       suma = suma + tablica_L(j,i)*tablica_x(j); 
    end
    wynik = (tablica_y(i)-suma)/tablica_L(i,i);
end


