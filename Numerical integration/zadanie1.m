f=[11];
h=0.5;
answ =prostyNewtonCotes(f, h)

f=[0, 11];
h=1;

answ =prostyNewtonCotes(f, h)

f = [0, 0.0107, 11];
h=0.5;

answ =prostyNewtonCotes(f, h)

f=[0, 0.000186, 0.1907, 11];
h=0.333;

answ =prostyNewtonCotes(f, h)

f=[0, 0.00001, 0.0107, 0.61945, 11];
h=0.25;

answ =prostyNewtonCotes(f, h)

f=[11, 0.0107421875, 0, 0.0107421875, 11];
h = 0.5;
answ =prostyNewtonCotes(f, h)