function [t,x] = appr(T, u, x0, fun, q)
%%Dzieli przedzial na ktorym rozwiazujemy rownanie na podprzedzialy w
%ktorych mamy stale sterowania p
% [T(1), T(2)] - calkowity przedzial czasu
% nt - liczba podprzedzialow  
% u - sterowanie
% x0 - punkt startowy
% q - siatka podprzedziału (Liczba punktow w podprzedziale)

nt = length(u) - 1;

tf = (T(2)-T(1))/nt; % czas trwania podprzedzialu
ti_0 = T(1); % czas poczatkowy

t = [];
x = [];

for i = 1:nt % for po wszystkich podprzedzialach
    
    ti_n = ti_0 + tf; % (ti_0, i_tn) - czas podprzedzialu
    
    [t_i,x_i] = rk4(x0, [ti_0 ti_n], u(i,:), q, fun);  
    
    ti_0 = ti_n; % kolejny czas poczatkowy
    x0 = x_i(end, :); % kolejny punkt poczatkowy jako ostatni punkt wyliczonego x-a
     
    % Dodanie wyliczonych wartosci z podprzedzialu do zbioru calego
    % przedialu
    t = [t; t_i]; 
    x = [x; x_i];
end;