function [sum] = LagrangeKK(x,wezlyX,wezlyY)
%   Zwraca warto�� funkcji dla x. wezlyX - znane wez�y X dla kt�rych s�
%   znane w�z�y Y
n = length(wezlyX);
sum=0;
for i=1:n
   sum = sum + wezlyY(i)*LagrangePomocnicza(i,x,wezlyX) ;
end
end

function [result] = LagrangePomocnicza(i,x, wezlyX)
result=1;
n=length(wezlyX);
for j=1:n
   if j ~=i 
       result = result .* ((x-wezlyX(j))/(wezlyX(i)-wezlyX(j)));
   end
end
end
