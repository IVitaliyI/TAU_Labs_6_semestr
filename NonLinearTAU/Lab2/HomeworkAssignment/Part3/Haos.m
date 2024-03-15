function otvet = Haos(f, x0, time, phase_coord)
    
    N0 = 8;
    otvet = zeros(1, N0 + 1);
    for n = 0:N0     % schet posled
        delta_posled = 0.1 / (10 ^ n); 
        
        theta = linspace(0,2 * pi);
        x = delta_posled * cos(theta) + x0(1);
        y = delta_posled * sin(theta) + x0(2);
        plot(x, y);
        axis equal;
        grid on;
    
        theta = linspace(0, 2 * pi, 9);
        x_resh = delta_posled .* cos(theta);
        y_resh = delta_posled .* sin(theta);
        plot(x_resh + x0(1), y_resh + x0(2), 'o');   % построение окружностей

        max_znac = zeros(1, 8);

        for j = 1:8
            tmp = phase_coord;
            len1 = size(tmp(:,1));
            init_cond = [x_resh(j) y_resh(j)];
            [~, v] = ode23t(f, time, init_cond);
            len2 = size(v(:,1));
            if len1(1) > len2(1)
                tmp((len2(1) + 1):len1(1), :) = [];
            elseif len2(1) > len1(1)
                v((len1(1) + 1):len2(1), :) = [];
            end
            prom = (v - tmp) .^ 2;
            max_znac(j) = max(sqrt(prom(:,1) + prom(:,2)));
        end


        otvet(1, n + 1) = max(max_znac);
    end
end

