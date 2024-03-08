clc;
clear all;
close all;

%% Constants

TMAX = 500;

prov = 'B';

if prov == 'A' 
    %Var A;
    gamma = 0.1;
    alpha = 0.05;
    
    X0 = 0.1;
    Y0 = -0.1;
    Z0 = 0.1;

else
    % Var B
    gamma = 0.87;
    alpha = 1.1;
    
    X0 = -1;
    Y0 = 0;
    Z0 = 0.5;
end

tspan = [0 TMAX];
xyz_0 = [X0;Y0;Z0];


[t, v] = ode45(@(t, v) func_V(t, v, gamma, alpha), tspan, xyz_0, odeset('RelTol',1e-3));


plot3(v(:,1), v(:,2), v(:,3), LineWidth=1);
hold on;
plot3(X0,Y0,Z0, 'o');
xlabel('X');
ylabel('Y');
zlabel("Z");

function dVdt = func_V(t, v, gamma, alpha)
    dVdt = [v(2,:) * (v(3, :) - 1 + v(1,:)^2) + gamma * v(1,:); ....
        v(1,:) * (3 * v(3,:) + 1 - v(1,:)^2) + gamma * v(2,:); ...
        -2 * v(3,:) * (alpha + v(1,:) * v(2,:))];
end

