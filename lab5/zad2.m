div_polyval = [];
div_trygval = [];

for i = 5:45
    
    [XX, YY] = meshgrid(linspace(0, 1, 101), linspace(0, 1, 101));
    [x, y, f, xp, yp] = lazik(i);
    
    [p] = polyfit2d(x, y, f);
    [FF_poly] = polyval2d(XX, YY, p);
    
    [p] = trygfit2d(x, y, f);
    [FF_tryg] = trygval2d(XX, YY, p);
        
    if i~=5
        div_polyval = [div_polyval, max(max(abs(FF_poly-FF_poly_prev)))];
        div_trygval = [div_trygval, max(max(abs(FF_tryg-FF_tryg_prev)))];
    end
    
    FF_poly_prev = FF_poly;
    FF_tryg_prev = FF_tryg;
    
end

figure
plot(6:45, div_polyval);
title("Maksymalna różnica między wartościami dla interpolacji wielomianowej");
ylabel("Maksymalna wartość różnicy interpolowanych funkcji");
xlabel("Ilość punktów pomiarowych K");
print(gcf, "zbiez_wiel.png", '-dpng');

figure
plot(6:45, div_trygval);
title("Maksymalna różnica między wartościami dla interpolacji trygonometrycznej");
ylabel("Maksymalna wartość różnicy interpolowanych funkcji");
xlabel("Ilość punktów pomiarowych K");
print(gcf, "zbiez_tryg.png", '-dpng');