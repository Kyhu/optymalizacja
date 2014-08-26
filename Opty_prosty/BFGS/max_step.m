function [ maxstep ] = max_step(Tau, d)
%MAX_STEP Summary of this function goes here
%   Funkcja wyliczajaca maksymalny krok kolejnej zmiany czasu przelaczen
%   przez BGFSa. Zwiazane to jest z tym, ze czas przelaczenia nr 2 nie moze
%   byc wiekszy niz czas przelaczenia nr 3 bo wtedy nie sa chronologicznie.


s = inf(length(Tau),1);
for i = 1:length(Tau)-1
   % if(d(i)-d(i-1) > 0)
    s(i) = (Tau(i+1)-Tau(i))/(d(i) - d(i+1));
   % end;    
end
%s
maxstep = min(s);


end

