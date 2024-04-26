clc;
clear all;
close all;

XMIN = -3;
XMAX = 3;
YMIN = -3;
YMAX = 3;
TMAX = 10;
STEP = 0.25;

tic;
event_out_of_bounds = @(t, z) outOfBounds(t, z, XMIN-0.01, XMAX+0.01, YMIN-0.01, YMAX+0.01);

phasePortrait(@varA, [XMIN XMAX], [YMIN YMAX], STEP, TMAX, event_out_of_bounds);

toc;

function dxdt = varA(t, x)
    dxdt = [x(2); sin(x(1)) * x(2) + log(1 + x(1)^2)];
end

function dxdt = varB(t, x)
    dxdt = [x(2); x(2)^4 * x(1) + x(2)];
end

function dxdt = varC(t, x)
    dxdt = [x(1)^2 - 4 * x(2); -2*x(2) + x(1) * x(2)];
end