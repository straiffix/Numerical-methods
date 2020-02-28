%A([1 3],:)=A([3 1], :);
%A = [2 1 5 -1.5; 5 3 2 4; -2 3 2 -4; 4.5 3 5 2];
%b = [1.7; 47.3; -46.4; 34.95];
%A= [1 2 3; 2 8 11; 3 14 25]
%b=[1; 3; 7]
A = [2 -3 -1; 4 -7 2; -2 -1 15];
b = [10; 9; -48];
[n, m] = size(A);
U = A;
L = zeros(n);
wsp_ar = zeros(0);

for i=1:n
    %Wybor elementu glownego w kazdej kolumnie
 
    %Zerowanie dolnej czesci macierzy
    for k = i+1:n
        wsp = U(k, i)/U(i, i);
        wsp_ar = [wsp_ar, wsp];
        D = U(i, :)*wsp;
        U(k, :)=U(k, :)-D;
        %b(k) = b(k) - b(i)*wsp;
    end
    
end

for i=1:n
    j = 1;
    while j<i
        L(i, j) = wsp_ar(1);
        wsp_ar(1)=[];
        j = j + 1;
    end
    L(i, i) = 1;
end

%X = A\b


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

norm(D, 1);