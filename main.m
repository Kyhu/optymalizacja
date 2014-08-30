clear_all_but_bp; % Czyści i zamyka wszystko oprócz breakpointow

load_constants;
path('BFGS/', path); % sciezka do BFGSa
path('line_search/', path); % sciezka do line searcha
path('quality_index/', path); % sciezka do wskaznika jakosci
path('model/', path); % sciezka do rownan stanu razem z rk4 i approkysmacja calego przebiegu
path('utils/', path); % sciezka do pomocnych narzedzi

Tau = [2 3 33;4 8 12;30 34 20]; % Dane z sufitu;

STOP_COND = 0;
while(~STOP_COND)
    
    %% BFGS
    [Tau,q] = BFGS(Tau, @obj_qi_tau, @qi_tau_grad)
    
    figure(9); hold on;
    [t,u] = Tau2u(Tau);    
    phi = interp1(1:length(phi), phi, t, 'nearest');    
    plot(t,phi, 'm-');
    plot(t,u);
    hold off;
    
    
    %% Logika najwyzszego poziomu zmieniajaca przełączenia
    
    % Jesli Tau(n+1) == Tau(n) (Z jakimś przyblizeniem) to usunac oba
    % przelaczenia    
    % Jesli Tau(n+1) == Tau(n) == Tau(n-1)(Z jakimś przyblizeniem) to
    % zamienic na jedno przelacenie itp
    %remove_pins(Tau)
    
    % Tworzenie szpilek w odpowiednich miejscach
    %generate_pins(Tau)
    
    
    STOP_COND = 1;
end

