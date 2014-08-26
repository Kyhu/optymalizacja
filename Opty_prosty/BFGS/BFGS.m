function [Tau_opt, qi_value_opt] = BFGS(Tau0, qi_fun, qi_grad)
% Implementacja algorytmu BFGS  (Doktorat dr Bani str 152)
% Bfgs to iteracyjna metoda do rozwiazywania problemow optymalizacji.
% W naszym przypadku szukamy takich punkczasowtow przelaczen sterowania Bang-Bang
% Zeby nasza funkcja jakosci byla jak najmniejsza.

% Tau0 - poczatkowe punkty przelaczen

path('line_search/', path); % Sciezka do linesearch

n = length(Tau0); % Rozmiar problemu.

H = eye(n)
g = qi_grad(Tau0) %gradient w punkcie startowym
d = ones(n,1);        %kierunek poszukiwania
Tau = Tau0;
qi_value = 99999; % Poczatkowa wartosc funkcji

STOP_CONDITION = 0; % Warunek stopu
i = 0;
while(STOP_CONDITION == 0)
    i = i+1;
    % Wyznaczenie kierunku poszukiwania`
    d = H^(-1)*(-g); % mozliwe ze jest szybszy numerycznie sposob rozwiazaywania tego rownania
    
    % Line search na tym kierunku
    opt.fo = qi_value; % poczatkowa wrtosc do struktury opt
    opt.gradd = d'*g; % rzut gradientu na kierunek poszukiwania (musi byc ujemny)
    opt.maxstep = max_step(Tau, d); % MAKSYMALN    
    [Tau_next, qi_value] = line_search(qi_fun,Tau,d,opt,1);
    
    % Majac nowy punkt optymaly na lini wyliczamy kolejne H wg Algorytmu
    g_next = qi_grad(Tau_next);
    r = g_next - g;
    z = Tau_next - Tau;

    z = z';
    
    H_next = H + (r*r')/(z'*r) - (H*z*z'*H)/(z'*H*z);
    
    g = g_next;
    Tau = Tau_next;
    H = H_next;
    
    if(i > 10) STOP_CONDITION = 1;
    end
    if(abs(norm(g)) < 0.01) STOP_CONDITION = 1;
    end
end
Tau_opt = Tau;
qi_value_opt = qi_value;

% Ograniczenia do BFGSa:
% Max Step
% Pochodne do gradientu - to nie wiem o co chodzi ale mialem zapisane ze
% takie ograniczenie ma byc