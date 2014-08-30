function [new_Tau] = remove_pins(Tau)
epsilon = 0.05;
global T;
Tau = [Tau, [T;T;T]];
for i = 1:size(Tau,1) % Dla każdego sterowania
   n = 1;
   k = 1;
    while(k < size(Tau,2)) % Dla kazdego przelaczenia (oprocz ostatniego)
        
        if (abs(Tau(i,k) - Tau(i,k+1)) > epsilon)
            new_Tau(i,n) = Tau(i,k);
            n = n + 1;
            k = k + 1;
        else
            k = k + 2;
        end  
    end    
end

new_Tau(new_Tau == 0) = T;