function [Tau] = generate_switch(Tau)

global phi;

[t,u] = Tau2u(Tau);
% Skalowanie
phi = interp1(1:length(phi), phi, t, 'nearest');
q = u.*phi;

new_Tau = zeros(size(Tau,1),size(Tau,2)+1);

for i = 1: size(Tau,1)    
    
    %minimum u.*phi
    [~,min_idx] = min(q(i,:));    
    new_switch_time = t(min_idx);

    new_Tau(i,:) =  sort([Tau(i,:), new_switch_time]);
    
end