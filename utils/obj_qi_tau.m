function q=obj_qi_tau(s,x0,sd,T)
% Testowa funkcja
x=x0+s*sd;
global ns;
Tau = reshape(x, [], ns);
q=qi_tau(Tau);