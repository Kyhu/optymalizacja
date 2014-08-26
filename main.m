close all;
clear all;

load_constants;
path('BFGS/', path); % sciezka do BFGSa
path('line_search/', path); % sciezka do line searcha
path('quality_index/', path); % sciezka do wskaznika jakosci
path('model/', path); % sciezka do rownan stanu razem z rk4 i approkysmacja calego przebiegu

Tau = [0.4,0.5]; % Dane z sufitu;

STOP_COND = 0;
while(~STOP_COND)
    
    %% BFGS
    % [Tau,q] = BFGS(Tau, @qi_tau, @obj_tau_grad)
    
    
    
    %% Logika najwyzszego poziomu zmieniajaca Taus
    
    % Jesli Tau(n+1) == Tau(n) (Z jakimś przyblizeniem) to usunac oba
    % przelaczenia
    
    % Jesli Tau(n+1) == Tau(n) == Tau(n-1)(Z jakimś przyblizeniem) to
    % zamienic na jedno przelacenie itp
    
    % Tworzenie szpilek w odpowiednich miejscach, tak jak Bania kazal
    %%
    
    
    STOP_COND = 1;
end

