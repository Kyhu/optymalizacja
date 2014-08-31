function q=obj_fun(s,x0,sd,T)
%%Testowa funkcja
x=x0+s*sd;
q=(x(1)-2)^4 + (x(2)-3)^2;