K = [5, 15, 25, 35];

[XX,YY]=meshgrid(linspace(0,1,101),linspace(0,1,101));

for i = K
    
    [x, y, f, xp, yp] = lazik(i);

    % wykres 1 - droga ruchu łazika
    subplot(2, 2, 1)
    plot(xp, yp, '-o', 'LineWidth',2);
    title(["Tor ruchu łazika dla K=" + i]);
    xlabel("x [m]");
    xlabel("y [m]");


    % wykres 2 - wykres wartości pomiarów
    subplot(2, 2, 2)
    surf(reshape(x, i, i), reshape(y, i, i), reshape(f, i, i));
    title(["Wartości zebrane przez łazik dla K=" + i]);
    xlabel("x [m]");
    xlabel("y [m]");
    zlabel("f(x, y)");


    % wykres 3 - interpolacja wielomianowa

    [p] = polyfit2d(x, y, f);
    [FF] = polyval2d(XX, YY, p);
    subplot(2, 2, 3);
    surf(XX, YY, FF);
    shading flat
    title(["Interpolacja wielomianowa dla K=" + i]);
    xlabel("x [m]");
    xlabel("y [m]");
    zlabel("f(x, y)");

    % wykres 4 - interpolacja wielomianowa

    [p] = trygfit2d(x, y, f);
    [FF] = trygval2d(XX, YY, p);
    subplot(2, 2, 4);
    surf(XX, YY, FF);
    shading flat;
    title(["Interpolacja trygonometryczna dla K=" + i]);
    xlabel("x [m]");
    xlabel("y [m]");
    zlabel("f(x, y)");
    
    tit = "K=" + i;
    sgtitle(tit)
    tit = tit + ".png";

    print(gcf, tit , '-dpng')

end