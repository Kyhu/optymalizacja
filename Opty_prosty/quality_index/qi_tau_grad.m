function dq = qi_tau_grad(Tau)
% Tu gradient funkcji jakosci po zmiennych decyzyjjnych (czyli czasach
% przelaczen)

global psi;
global psit;
global phi;
global u0;

%% Wyliczanie funkcji przelaczen
phi = -psi(:,3);

%% Wyliczanie delta u
delta_u = zeros(size(Tau));

for i = 1:size(Tau,1)
    u = u0(i);
    for j = 1:size(Tau,2)
        
        delta_u(i,j) = 2*(-u);
        u = -u;
        
    end
end

%% Wyliczenie pochodnych na calej osi
grad = phi*delta_u;

%% Znalezienie Tau w wektorach czasu
dq = zeros(size(Tau));

for i = 1:size(Tau,1)
    for j = 1:size(Tau,2)
        
        [~, Tau_index] = min(abs(psit-Tau(i,j)));
        
        dq(i,j) = grad(Tau_index,j);
    
    end
end

%% Wyniki
dq = dq';

