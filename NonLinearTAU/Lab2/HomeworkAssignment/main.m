clc;
clear all;
close all;

tic;

XMAX = 2;
YMAX = 2;
TMAX = 10;
STEP = 0.1;

tic;
event_out_of_bounds = @(t, z) outOfBounds(t, z, XMAX+0.01);

phasePortrait(@dynamics, XMAX, YMAX, STEP, TMAX, event_out_of_bounds);

toc;