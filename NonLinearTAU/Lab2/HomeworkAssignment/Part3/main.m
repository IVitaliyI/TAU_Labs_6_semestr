clc;
clear all;
close all;


XMAX = 0.1;
YMAX = 0.1;
TMAX = 10;
STEP = 0.5;

time = [0 5];

x0 = [0 0];

tic;

func = @varC;
phase_coord = phasePortrait(func, time, x0);
pr = Haos(func, x0, time, phase_coord)

toc;

function dxdt = varA(t, x)
    if t == 0
        dxdt = [x(2); -x(2) - x(1) + 1];
    elseif mod(round(t - 0.5),2) == 0
        dxdt = [x(2); -x(2) - x(1) + 1];
    else
        dxdt = [x(2); -x(2) - x(1) - 1];
    end
end

function dxdt = varB(t, x)
    if t == 0
        dxdt = [x(2); -x(2) - x(1) + t];
    elseif mod(round(t - 0.5),2) == 0
        dxdt = [x(2); -x(2) - x(1) + t];
    else
        dxdt = [x(2); -x(2) - x(1) - t];
    end
end

function dxdt = varC(t, x)
    dxdt = [x(2,:); -x(2,:) - x(1,:) + sin(1 ./ (t + 10^-7))];
end