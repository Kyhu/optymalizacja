function q = qi_x(T, x)    %Czas koncowy, stan koncowy
lambda = 1;
calka = x(end,7);
xT = x(end, 1:6);

q = T + lambda*calka + norm(xT)^2; % wskaznik jakosci - rownanie 4.37 lub 4.40 w doktoracie Dr Banii(strona 104)
% Czemu calka to xT(7)? Zobacz wyklad 2 Koryta, fragment o wskazniku z calka

