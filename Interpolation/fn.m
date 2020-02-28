x_nodes1 = linspace(-2, 2, 5);
for i=1:length(x_nodes1)
    x_nodes1(i) = WezlyCzebyszewaDowolnyPrzedzial(i, 5, -2,2);
end
y_nodes1 = (1+x_nodes1.^4) ./ (1 + x_nodes1.^6);
x_nodes2 = linspace(-2, 2, 9);
for i=1:length(x_nodes2)
    x_nodes2(i) = WezlyCzebyszewaDowolnyPrzedzial(i, 9, -2,2);
end
y_nodes2 = (1+x_nodes2.^4) ./ (1 + x_nodes2.^6);
x_nodes3 = linspace(-2, 2, 11);
for i=1:length(x_nodes3)
    x_nodes3(i) = WezlyCzebyszewaDowolnyPrzedzial(i, 11, -2,2);
end
y_nodes3 = (1+x_nodes3.^4) ./ (1 + x_nodes3.^6);


yn = [0.4249 0.5676 0.7711 1.0000 1.1168 1.0792 1.0214 1.0015 1.0000 1.0015 1.0214];
xx = linspace(-2,2);
yy = (1+xx.^4) ./ (1 + xx.^6);
yy1 = zeros(1, length(xx));
yy2 = zeros(1, length(xx));
yy3 = zeros(1, length(xx));

for i=1:length(xx)
yy1(i)= newtonKK(xx(i), x_nodes1, y_nodes1);

end
bledy1=abs(yy1-yy);
av1 = mean(bledy1)
max1 = max(bledy1)

for i=1:length(xx)
yy2(i)= newtonKK(xx(i), x_nodes2, y_nodes2);

end
bledy2=abs(yy2-yy);
av2 = mean(bledy2)
max2 = max(bledy2)

for i=1:length(xx)
yy3(i)= newtonKK(xx(i), x_nodes3, y_nodes3);
end
bledy3=abs(yy1-yy);
av3 = mean(bledy3)
max3 = max(bledy3)


plot(xx, yy, x_nodes1, y_nodes1,'r', x_nodes2, y_nodes2, 'p', x_nodes3, y_nodes3, 'o', xx, yy1, xx, yy2, xx, yy3, 'r');
% 
% x0 = 0
% xmax = 0
% for i=1:length(yy3)
% xb = abs(yy3(i)-yy(i))
% if xb > xmax 
%     xmax = xb
% end
% x0 = x0 + xb
% 
% end
% x0 = x0 ./ length(yy3)
% xmax
