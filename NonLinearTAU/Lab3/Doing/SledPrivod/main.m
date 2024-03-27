clc;
clear all;
close all;

%   ///   ДПР-62Н1-01   \\\

P_nom = 15.6; % Вт
N_nom = 9000; % об/мин
U_a = 27; % В
I_a = 1.2; % A
R_a = 2.1; % Om
J_a = 3.6 * 10^-6; % кг*м^2
m = 0.02; % kg
f_tr = 1e-6;


w_nom = 2 * pi * N_nom / 60; % рад/с
k_m = P_nom / (w_nom * I_a);
k_w = (U_a - R_a * I_a)/ w_nom;

L_a = 0.1*((J_a * (R_a^2)) / (k_m * k_w));

