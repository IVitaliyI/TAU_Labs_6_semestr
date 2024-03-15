

r = 3;
xc = 4;
yc = 3;

theta = linspace(0,2 * pi);
x = r * cos(theta) + xc;
y = r * sin(theta) + yc;
plot(x, y);
axis equal
hold on

theta = linspace(0, 2 * pi, 9);
x_resh = r .* cos(theta);
y_resh = r .* sin(theta);
plot(x_resh + xc, y_resh + yc, 'o');

