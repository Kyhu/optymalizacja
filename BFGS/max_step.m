function [ maxstep ] = max_step(Tau, d)
%MAX_STEP
%   Funkcja wyliczajaca maksymalny krok kolejnej zmiany czasu przelaczen
%   przez BGFSa. Zwiazane to jest z tym, ze czas przelaczenia nr 2 nie moze
%   byc wiekszy niz czas przelaczenia nr 3 bo wtedy nie sa chronologicznie.

% Poczatkowy vector kroków - nieskonczonosc
s = inf(length(Tau),1);

% Dla kazdego przelaczenia
for i = 1:length(Tau)-1
    
    % Warunek chronologicznosci dla kazdego Tau
    % Tau(i) + s*d(i) <= Tau(i+1) + s*d(i+1) 
    % Z niego liczymy maksymalny krok dla Tau(i)
    
    s(i) = (Tau(i+1)-Tau(i))/(d(i) - d(i+1));
end
% Zwracany maksymalny krok jest najmniejszym z wszystkich
maxstep = min(s);

end

