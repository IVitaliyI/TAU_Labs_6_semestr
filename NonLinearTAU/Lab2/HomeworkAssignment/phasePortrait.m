function phasePortrait(f, X0, Y0, STEP, TMAX, event_fnc)

    [x, y] = meshgrid(X0(1):STEP:X0(2), Y0(1):STEP:Y0(2));
    
    [d1, d2] = size(x);
    u = zeros(d1, d2);
    v = zeros(d1, d2);
    t = 0;

    for i = 1:d1
        for j = 1:d2
            YPrime = f(t, [x(i,j), y(i,j)]);
            u(i, j) = YPrime(1);
            v(i, j) = YPrime(2);
        end    
    end
    

    for i = 1:d1
       for j = 1:d2
           Vmod = sqrt(u(i, j)^2 + v(i,j)^2);
           u(i, j) = u(i, j) / Vmod;
           v(i, j) = v(i, j) / Vmod;
        end    
    end
    

    figure(1);
    hold on;
    quiver(x,y,u,v,0.5);
    

    for i = 1:d1
        for j = 1:d2
            x0 = [x(i,j), y(i,j)];
            [~,z, ~,~,~] = ode23t(f,[0, TMAX],x0, odeset('RelTol',1e-3,'Events', event_fnc));
            plot(z(:,1),z(:,2));
        end
    end

end
