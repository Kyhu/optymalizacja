function [ maxstep ] = max_step(x, d)
%MAX_STEP
%   Funkcja wyliczajaca maksymalny krok kolejnej zmiany czasu przelaczen
%   przez BGFSa. Zwiazane to jest z tym, ze czas przelaczenia nr 2 nie moze
%   byc wiekszy niz czas przelaczenia nr 3 bo wtedy nie sa chronologicznie.

% Macierz przelaczen
Tau = reshape(x,3,[]);
d = reshape(d,3,[]);

% Poczatkowy vector kroków - nieskonczonosc
s = inf(size(Tau));

% Dla kazdego sterowania
for j = 1:size(Tau,1)
    % Dla kazdego przelaczenia
    for i = 1:size(Tau,2)-1
        
        % Warunek chronologicznosci dla kazdego Tau
        % Tau(i) + s*d(i) <= Tau(i+1) + s*d(i+1)
        % Z niego liczymy maksymalny krok dla Tau(i)
        
        s(j,i) = (Tau(j,i+1)-Tau(j,i))/(d(j,i) - d(j,i+1));
    end
end
% Zwracany maksymalny krok jest najmniejszym z wszystkich
maxstep = min(min(s));

end

