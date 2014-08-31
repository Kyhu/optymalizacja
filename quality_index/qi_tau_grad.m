function dq = qi_tau_grad(Tau_vec)
%%Gradient funkcji jakosci po zmiennych decyzyjnych (czyli czasach
% przelaczen)
% Wzor na gradient : phi*df/du * delta_u;
% phi - funkcja przelaczen
% df/du - pochodna funkcji rhs po sterowaniu
% delta_u - roznica miedzy wartosciami nowego sterowaniem a starego
% Na końcu zwracamy wartosc gradientu w punktach przelaczen

Tau = reshape(Tau_vec,3,[]);

% Stale i zmienne globalne
global psi psit phi u0;

%% Wyliczanie funkcji przelaczen
% Psi' * f1; f1 = [0;0;0;1;1;1;0] (Czy sterowanie spod całki też?)
phi = [-psi(:,4), -psi(:,5), -psi(:,6)];

%% Wyliczanie delta u
delta_u = zeros(size(Tau));

for i = 1:size(Tau,1) % Dla każdego sterowania
    u = u0(i);
    for j = 1:size(Tau,2) % Dla kazdego przelaczenia
        
        delta_u(i,j) = 2*(-u); 
        u = -u;
        
    end
end

%% Wyliczenie pochodnych na calej osi
grad = -phi*delta_u;

%% Znalezienie Tau w wektorach czasu
dq = zeros(size(Tau));

for i = 1:size(Tau,1) % Dla każdego sterowania
    for j = 1:size(Tau,2) % Dla kazdego przelaczenia
        
        [~, Tau_index] = min(abs(psit-Tau(i,j))); % W wekotrze czasu Psi - psit szukamy tego przelaczenia
        dq(i,j) = grad(Tau_index,j); % Majac index przelaczenia wyciagamy jego gradient
    
    end
end

%% Wynik - do wektora
dq = reshape(dq,[],1);

