function [ q ] = qi_tau_wrapper(s,x0,sd,T)
%%Wrapper wskaznika jakosci, tak aby mozna go bylo uzywac przy pomocy
%dostarczonej metody szukania na kierunku

x=x0+s*sd;
Tau = reshape(x,3,[]);
[q,~,~] = qi_tau(Tau);
end

