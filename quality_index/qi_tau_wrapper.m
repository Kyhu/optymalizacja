function [ q ] = qi_tau_wrapper(s,x0,sd,T)
%%Wrapper wskaznika jakosci, tak aby mozna go bylo uzywac przy pomocy
%dostarczonej metody szukania na kierunku

x=x0+s*sd;
q = qi_tau(x);

end

