function phase_coord = phasePortrait(f, time, x0)
  
    figure(1);
    hold on;
   
    [t,z] = ode23t(f,time,x0);
    plot(z(:,1),z(:,2));
    quiv = zeros(10,4); 
    for i = 1:size(z(:,1))
        for j = 1:5  
            radx = rand / 1000 - 0.0005;
            rady = rand / 1000 - 0.0005;
            mas = f(t(i), [z(i,1) + radx; z(i,2) + rady]);
            nm = sqrt(mas(1)^2 + mas(2)^2);
            quiv(j, 1) = z(i,1) + radx;
            quiv(j, 2) = z(i,2) + rady;
            quiv(j, 3) = mas(1) / nm;
            quiv(j, 4) = mas(2) / nm;
        end
        quiver(quiv(:,1), quiv(:,2), quiv(:,3), quiv(:,4), 0.5);
        phase_coord = z;
    end
    
    

end

