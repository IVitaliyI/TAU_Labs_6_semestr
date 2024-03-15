function dxdt = dynamics(t,x)
    dxdt = [x(2); 5 * x(2) ^ 2 + x(1) * (x(1) - 1)];   
end

