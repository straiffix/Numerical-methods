Answ = ones(4, 1000); % i = 1000
a = -1;
b = 1;

for rzed=1:4
    for i=1:1000
        N = rzed * i + 1;
        h = (b - a) / (N - 1);
        x = linspace(a, b, N);
        y = ones(1, N);
        for j=1:N
            y(j) = 11 * (x(j)^10);
        end
        Answ(rzed, i) = zlozonyNewtonCotes(y, h, rzed);
    end
end

loglog([1:1000], abs(Answ(1, :) - 2.0), '-r', [1:1000], abs(Answ(2, :) - 2.0), '-g', [1:1000], abs(Answ(3, :) - 2.0), '-b', [1:1000], abs(Answ(4, :) - 2.0), '-m')
grid on
legend('d = 1','d = 2','d = 3','d = 4')

% rzed = 3;
% 
% N = ones(1, 1000);
% h = ones(1, 1000);
% for i = 1:1000
%     N(i) = (rzed-1) * i + 1;
%     h(i) = (b - a) / (N(i)-1);
% end
% 
% answ = ones(1, 1000);
% for i =1:1000
%     x = linspace(a, b, N(i));
%     y = ones(1, N(i));
%     for j=1:(N(i))
%         y(j) = 11 * (x(j)^10);
%     end
% 
%     answ(i) = zlozonyNewtonCotes(y, h(i), rzed);
%     answ(i) = abs(answ(i) - 2.0);
% end
% 
% semilogy(answ);