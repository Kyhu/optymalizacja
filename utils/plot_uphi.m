function [ ] = plot_uphi( Tau )
%PLOT_UPHI Rysuje zaleznosc miedzy phi a u(t)

global phi;

nu = size(Tau,1);
subplot(nu, 1, 1);

[t,u] = tau2u(Tau);
phi = strech_vector(phi, length(t));

% Wykres funkcji przelaczen i czasow przelaczen
% Subplot dla kazdego sterowania
% Wyliczenie max phi dla kazdego sterowania

for i = 1:nu    
    subplot(nu, 1, i); hold on;
        
    phi_i = phi(:,i)/max(phi(:,i));
    plot(t,phi_i, 'b-');
    plot(t,u(:,i), 'k-');
    
    hold off;
end

end

