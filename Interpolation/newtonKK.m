function suma = newtonKK(x,wezlyX, wezlyY)
N = size(wezlyX, 2);
matrycaNewtona = zeros(N, N);
matrycaNewtona(:, 1) = transpose(wezlyY);

for i = 2:N
    for j = i:N
        matrycaNewtona(j, i) = (matrycaNewtona(j, i-1) - matrycaNewtona(j-1, i-1)) / (wezlyX(j) - wezlyX(j-i+1));
    end
end

a = diag(transpose(matrycaNewtona));
p = a(N);

for i=N-1:-1:1
    p = [p a(i)] - [0 p*wezlyX(i)];
end

% suma = polyval(p, x);

suma = 0;
NN = size(p, 2);
for i=1:NN
    suma = suma + p(i)*x^(NN-i);
end
    
end

