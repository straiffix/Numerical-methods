%A([1 3],:)=A([3 1], :);
%A = [2 1 5 -1.5; 5 3 2 4; -2 3 2 -4; 4.5 3 5 2];
%b = [1.7; 47.3; -46.4; 34.95];
%A = [4 -2 2; -2 2 2; 2 2 14];
%b = [-6; 4; 0];
[n, m] = size(A);
%load('easy_Ab.mat')
load('tricky_Ab.mat')
for i=1:n
    %Wybor elementu glownego w kazdej kolumnie
    j=i;
    max = 0;
    m_max = 1;
    for k=j:n
        if (abs(A(k, j))>abs(max)) && (A(j, k)~=0)
            max = A(k, j);
            m_max = k;
        end
    end
    if max ~= 0
        A([m_max, j], :) = A([j, m_max], :);
        temp = b(j);
        b(j) = b(m_max);
        b(m_max) = temp;
    end
    
    %Zerowanie dolnej czesci macierzy
    for k = i+1:n
        wsp = A(k, i)/A(i, i);
        D = A(i, :)*wsp;
        A(k, :)=A(k, :)-D;
        b(k) = b(k) - b(i)*wsp;
    end
end

%X = A\b


%Znalezenie x
x = ones(n, 1);

for i = n:-1:1
    sum = 0;
    for j = i+1:n
        sum = sum + A(i, j)* x(j);
    end
    x(i) = (b(i) - sum)/A(i, i);
end


%Opracowanie wynikow
D = A*x - b;
err = norm(D, 1)