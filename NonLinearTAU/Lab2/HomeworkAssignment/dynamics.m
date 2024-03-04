function dxdt = dynamics(t,x)
    dxdt = [x(2); x(2) * x(1) + 2 * x(1) ^ 3 - 5 * x(1) + 1];   
end

