%A = [6 3 6; 2 3 5; -1 2 4];
%A = [2 5 7; 6 3 4; 5 -2 -3];
%A = [2 1 5 -1.5; 5 3 2 4; -2 3 2 -4; 4.5 3 5 2];
load('easy_Ab.mat')
B = A;

[n, m] = size(A);

for k=1:n
    for i=1:n
        if i==k
            continue
        end
     A(i, k) = A(i, k) / A(k, k);
    end
    for i=1:n
        if i==k
            continue
        end
        for j=1:n
            if j==k
                continue
            end
           A(i, j) = A(i, j) - A(i, k) * A(k, j);
        end
    end
    for j=1:n
        if j==k
            continue
        end
        A(k, j) = -1 * A(k, j) / A(k, k);
    end
    A(k, k) = 1 / A(k, k);
end
x =  A * b;
%B??d otrzymanych wynik?w
Db = B*x - b;
norm(Db, 1)

%Bl?d otrzymanej macierzy
I = eye(n);
D = B * A - I;
norm(D, 1)