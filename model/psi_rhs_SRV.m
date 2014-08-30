function dpsi = psi_rhs_SRV(t, psi, x)
% Rownania sprzezone, wyliczone symbolicznie
% Czy potrzebne nam 't' w argumencie funkcji?

if length(psi) ~= 7   
    error('Zly rozmiar psi');
end;
if length(x) ~= 7
    error('Zly rozmiar x');
end;

dpsi = zeros(1,7);


% dpsi(1) = psi(4)*(((x(1) + 1)^2 + x(2)^2 + x(3)^3)^(9/2) + (9*(2*x(1) + 2)*(x(1) + 1)*((x(1) + 1)^2 + x(2)^2 + x(3)^3)^(7/2))/2 - 1) - (3*psi(5)*x(2)*(2*x(1) + 2))/(2*((x(1) + 1)^2 + x(2)^2 + x(3)^3)^(5/2)) - (3*psi(6)*x(3)*(2*x(1) + 2))/(2*((x(1) + 1)^2 + x(2)^2 + x(3)^3)^(5/2));
% dpsi(2) = 9*psi(4)*x(2)*(x(1) + 1)*((x(1) + 1)^2 + x(2)^2 + x(3)^3)^(7/2) - (3*psi(6)*x(2)*x(3))/((x(1) + 1)^2 + x(2)^2 + x(3)^3)^(5/2) - psi(5)*((3*x(2)^2)/((x(1) + 1)^2 + x(2)^2 + x(3)^3)^(5/2) - 1/((x(1) + 1)^2 + x(2)^2 + x(3)^3)^(3/2) + 1);
% dpsi(3) = psi(6)*(1/((x(1) + 1)^2 + x(2)^2 + x(3)^3)^(3/2) - (9*x(3)^3)/(2*((x(1) + 1)^2 + x(2)^2 + x(3)^3)^(5/2))) + (27*psi(4)*x(3)^2*(x(1) + 1)*((x(1) + 1)^2 + x(2)^2 + x(3)^3)^(7/2))/2 - (9*psi(5)*x(2)*x(3)^2)/(2*((x(1) + 1)^2 + x(2)^2 + x(3)^3)^(5/2));
% dpsi(4) = 2*psi(5) - psi(1);
% dpsi(5) = - psi(2) - 2*psi(4);
% dpsi(6) = -psi(3);
% dpsi(7) = 0; % Zero bo x7 to szcztuczna zmienna - zobacz jej opis w rhs_SRV.m

dpsi(1) = psi(1);
dpsi(2) = psi(2);
dpsi(3) = psi(3);
dpsi(4) = psi(4);
dpsi(5) = psi(5);
dpsi(6) = psi(6);
dpsi(7) = 0; % Zero bo x7 to szcztuczna zmienna - zobacz jej opis w rhs_SRV.m