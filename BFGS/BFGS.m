function [X_opt, qi_value_opt] = BFGS(X0, qi_fun, qi_grad)
%%Implementacja algorytmu BFGS  (Doktorat dr Bani str 152)
% Bfgs to iteracyjna metoda do rozwiazywania problemow optymalizacji.
% W naszym przypadku szukamy takich czasow przelaczen sterowania Bang-Bang
% Zeby nasza funkcja jakosci byla jak najmniejsza.
% X0 - poczatkowe punkty przelaczen
% qi_fun - funkcja jakosci zalezna od czasow przelaczen
% qi_grad - gradient powyzszej funkcji

n = length(X0);             % Rozmiar problemu.

%% Wartosci poczatkowe
H = eye(n);                 % Macierz H
qi_value = qi_fun(0,X0,0,0);     % Wartosc funkcji
g = qi_grad(X0);            % Wartosc gradientu
d = ones(n,1);              % Kierunek poszukiwania
X = X0;                     % Czasy przelaczen

STOP_CONDITION = 0; % Warunek stopu
i = 0; % liczba iteracji
while(STOP_CONDITION == 0)
    i = i+1
    
    %% Wyznaczenie kierunku poszukiwania`
    d = H\(-g); % mozliwe ze jest szybszy numerycznie sposob rozwiazaywania tego rownania
    
    %% Optymalizacja na kierunku
    
    % Ustawienie opcji
    opt.fo = qi_value;              % Poczatkowa wartosc
    opt.gradd = d'*g;               % Rzut gradientu na kierunek poszukiwania (musi byc ujemny)
    opt.maxstep = max_step(X, d);   % Maksymalny krok w poszukiwaniu liniowym
    opt.maxstep = 1000;
    % Wywolanie optymalizacja na kierunku
    [X_next, qi_value] = line_search(qi_fun,X,d,opt,1);

    %% Majac nowy punkt optymaly na lini wyliczamy kolejne H wg Algorytmu
    g_next = qi_grad(X_next);
    r = g_next - g;
    z = X_next - X;
    
    H_next = H + (r*r')/(z'*r) - (H*z*z'*H)/(z'*H*z);
    
    %% Wartosci do kolejnej iteracji
    g = g_next;
    X = X_next;
    H = H_next;
    
    %% Warunki stopu - DO UZUPELNIENIA
    if(i > 1) 
        STOP_CONDITION = 1;
    end
    %if(abs(norm(g)) < 0.01) STOP_CONDITION = 1;
    %end
end

%% Rezultat
X_opt = X;
qi_value_opt = qi_value;
