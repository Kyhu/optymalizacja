path('BFGS/', path);            % sciezka do BFGSa
path('line_search/', path);     % sciezka do line searcha
path('quality_index/', path);   % sciezka do wskaznika jakosci
path('model/', path);           % sciezka do rownan stanu razem z rk4 i approkysmacja calego przebiegu
path('utils/', path);           % sciezka do pomocnych narzedzi

clear_all_but_bp;   % Czyści i zamyka wszystko oprócz breakpointow
load_constants;     % Laduje parametry i zmienne globalne

global phi;
Tau = [25;30;25];     % Poczatkowe przelaczenie

STOP_COND = 0;
while(~STOP_COND)
    
    %% BFGS
    [Tau,q] = BFGS(Tau, @qi_tau_wrapper, @qi_tau_grad)
    
    plot_uphi(Tau);
    
    
    %% Logika najwyzszego poziomu zarzadzajaca czasami przelaczen    
    % Jesli Tau(n+1) == Tau(n) (Z jakimś przyblizeniem) to usunac oba
    % przelaczenia    
    % Jesli Tau(n+1) == Tau(n) == Tau(n-1)(Z jakimś przyblizeniem) to
    % zamienic na jedno przelacenie itp
    
    %remove_pins(Tau)
    
    % Tworzenie szpilek w miejscach gdzie phi*u jest najmniejsze    
    %generate_pins(Tau)
    
    
    STOP_COND = 1;
end

