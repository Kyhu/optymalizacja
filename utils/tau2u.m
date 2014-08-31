function [t,u] = tau2u(Tau)
%%Funkcja generująca przebieg sterowania u(t) na podstawie wektora czasow
% przelaczen
% Tau - czasu przeleczen
% [t,u] - u(t)

global u0 nt T;

% Inizjalizacja przebiegu sterowania zerami
t = linspace(0,T,nt);
u = zeros(size(Tau,1), length(t));

% Dodanie czasu konca jako ostatniego przelaczenia
Tau = [Tau, [T;T;T]];

%% Generacja sterowania
for j = 1:size(Tau,1) % Dla kazdego sterowania
    i = 1;
    u_temp = u0(j); % Wartosc poczatkowa sterowania i
    
    % Przy kazdym przelaczeniu zmien sterowanie na przeciwne
    for n = 1:size(Tau,2)
        
        if(i<= nt)
            
            % Poki nie ma przelaczenia to podtrzymuj sterowanie
            while (i < nt && t(i) < Tau(j,n))
                u(j,i) = u_temp;
                i = i + 1;
            end;
            
            % Zmien sterowanie na przeciwne
            u_temp = -u_temp;
            u(j,i) = u_temp;
            i = i + 1;
        end
    end
end
u = u';
t = t';
