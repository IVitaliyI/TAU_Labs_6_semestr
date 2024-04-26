clc;
clear all;
close all;

SAMPLING_PERIOD = 1e-4;  % s
SIMULATION_TIME = 1;     % s


% Sampled signal of r(t) = A * sin(t);   r(t) = 1500 * sin(100 * t + pi)

% r*(t) = r(nT) * delta(t - nT)

% TIME = 0:1e-5:SIMULATION_TIME;
% Discret_time = transpose(0:SAMPLING_PERIOD:SIMULATION_TIME);
% r_z = 1500 * sin(100 * Discret_time + pi);

%% Отрисовка  Ctrl + R
% figure
% hold on
% plot(TIME, 1500 * sin(100 * TIME + pi), ':r');
% stem(transpose(Discret_time), transpose(r_z), 'Color', 'Blue');
%% 
addpath("Doinig_lab\");

s = tf('s');

Peredat_Regul = 1.72626593892633 + 0.624359128150613 * (1 / s) + 1.06047859947846 * (7085.10834495725 / (1 + 7085.10834495725 * (1 / s)))

Z_Regul = c2d(Peredat_Regul, 1e-4, 'zoh')

