function [value, isterminal, direction] = outOfBounds(t, z, XMIN, XMAX, YMIN, YMAX) 
% функция детекции выхода за пределы сетки

value = (z(1) > XMAX) || (z(1) < XMIN) || (z(2) > YMAX) || (z(2) < YMIN); % --- условие
isterminal = 1; % --- остановить симуляцию
% direction --- параметр, отвечающий за направление перескока через
direction = 0; % --- параметр, который нам не интересен, но необходим
end