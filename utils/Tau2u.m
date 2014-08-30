function [t,u] = Tau2u(Tau)
%Funkcja przelaczen

global u_max nt T;

t = linspace(0,T,nt);
u = zeros(size(Tau,1), length(t));

Tau = [Tau, [T;T;T]];
for j = 1:size(Tau,1)
    i = 1;
    u0 = u_max;
    for n = 1:size(Tau,2)
        while (i < nt && t(i) < Tau(j,n))
            u(j,i) = u0;
            i = i + 1;
        end;

        u0 = -u0;
        u(j,i) = u0;
        i = i + 1;
    end
end

