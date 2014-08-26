function [t,u] = switch_fun(Tau)
%Funkcja przelaczen

global u_max nt;

t = linspace(0,Tau(end),nt);
u = zeros(size(Tau,1), length(t));

for j = 1:size(Tau,1)
    i = 1;
    u0 = 1;
    for n = 1:size(Tau,2)
        while (t(i) < Tau(j,n))
            u(j,i) = u0;
            i = i + 1;        
        end;

        u0 = -u0;
        u(j,i) = u0;
        i = i + 1;
    end
end

