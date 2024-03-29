clc;
clear all;
close all;


XMAX = 5;
YMAX = 5;
TMAX = 10;
STEP = 0.5;

tic;
event_out_of_bounds = @(t, z) outOfBounds(t, z, XMAX+0.01);

phasePortrait(@varC, XMAX, YMAX, STEP, TMAX, event_out_of_bounds);

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