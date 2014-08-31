function dx = rhs_SRV(t, x, u)
%%Rownania Space Randez Vous (Doktorat dr Bani - str 103)
% Czy potrzebne nam 't' w argumencie funkcji?

if length(x) ~= 7   
    error('Zly rozmiar x');
end;
if length(u) ~= 3
    error(['Zly rozmiar u: ', num2str(length(u))]);
end;

% Stale parametry
% global w0 R0 m F;
% Tu nie wiem jakie to u dac
% F = u;
% a = F/(m*w0^2*R0);
a = u;

% Zmienne pomocnicze
r = sqrt((x(1)+1)^2 + x(2)^2 + x(3)^3);
abs_r_3 = abs(r)^(-3);

dx = zeros(1,7);
dx(1) = x(4);
dx(2) = x(5);
dx(3) = x(6);
dx(4) = 2*x(5) + (1+x(1))*(1-abs_r_3) + a(1);
dx(5) = -2*x(4) + x(2)*(1-abs_r_3) + a(2);
dx(6) = -x(3)*abs_r_3 + a(3);
% Dodatkowa zmienna - całka wycięta ze współczynnika jakości
dx(7) = sqrt(a(1)^2 + a(2)^2 + a(3)^2);  
