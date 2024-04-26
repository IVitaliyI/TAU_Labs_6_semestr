clc;
clear all;
close all;

%% VARIANT
i = 4;
K = mod((i + 4), 5) + 1
clc;

%% CONSTANTS
U_INPUT = 3.3;  % Input voltage: V
R_1 = 1750 * i; % Resistance: Ohm
R_2 = 175 * i;  % Resistance: Ohm
C_1 = (mod(i, 3) + 1) * 10e-6; % Capacity: F
C_2 = (mod(i, 2) + 1) * 10e-6; % Capacity: F
L = (mod(i, 3) + 1) * 2; % Inductance: H