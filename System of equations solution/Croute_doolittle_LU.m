%A = [2 1 5 -1.5; 5 3 2 4; -2 3 2 -4; 4.5 3 5 2];
%b = [1.7; 47.3; -46.4; 34.95];
%A = [2 -3 -1; 4 -7 2; -2 -1 15];
%b = [10; 9; -48];
load('easy_Ab.mat')
%load('tricky_Ab.mat')

[n, m] = size(A);
U = ones(n); 
L = ones(n); 

for i=1:m
    U(1, i) = A(1, i);
    
end
for i=2:m
    L(i, 1) = A(i, 1) / U(1, 1);
    
end

for k=2:n
    for i = k:n
        sum = 0;
        for j=1:k-1
            sum = sum + L(k, j)*U(j, i);
        end
        U(k, i) = A(k, i) - sum;
    end
    for i = k+1:n
        sum = 0;
        for j=1:k-1
            sum = sum + L(i, j)*U(j, k);
        end
        L(i, k) = (A(i, k) - sum)/U(k, k);
    end
end

%Zerowanie dolnej i gornej czesci
for i=1:n-1
    for j = i+1:n
        L(i, j)=0;
        U(j, i)=0;
    end
end

%Znalezenie x
y = ones(1, n);
for i = 1:n
    sum = 0;
    for j = 1:i-1
        sum = sum + L(i, j) * y (j);
    end
    y(i) = (b(i) - sum)/L(i, i);
end

x = ones(1, n);
for i = n:-1:1
    sum = 0;
    for j = i+1:n
        sum = sum + U(i, j)*x(j);
    end
    x(i) = (y(i) - sum)/U(i, i);
end
        
%Opracowanie wynikow
D = A - L * U;
err = norm(D, 1)