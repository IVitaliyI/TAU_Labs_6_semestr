clc;
clear all;
close all;


XMAX = 0.1;
YMAX = 0.1;
TMAX = 0.5;
STEP = 0.5;

tic;

phasePortrait(@varB, TMAX);

toc;

function dxdt = varA(t, x)
    if mod(round(t - 0.5),2) == 0
        dxdt = [x(2); -x(2) - x(1) + 1];
    else
        dxdt = [x(2); -x(2) - x(1) - 1];
    end
end

function dxdt = varB(t, x)
    if mod(round(t - 0.5),2) == 0
        dxdt = [x(2,:); -x(2,:) - x(1,:) + t];
    else
        dxdt = [x(2,:); -x(2,:) - x(1,:) - t];
    end
end

function dxdt = varC(t, x)
    dxdt = [x(2,:); -x(2,:) - x(1,:) - sin(1 ./ (t + 10^-7))];
end