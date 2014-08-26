% Przyklad dzia�ania funkcji line_search

x0 = [7 10]'; % punkt startowy
sd = [1 1]' - x0; % kierunek poszukiwania
T = 1; % nie uzywamy, ale bedzie potrzebne przy innych zadaniach (?)
f0 = obj_fun(0,x0,sd,T); % wartosc funkcji celu w punkcie poczatkowym
g = obj_fun_grad(x0); % gradient w x0
opt.f0 = f0; % poczatkowa wrtosc do struktury opt
opt.gradd = sd'*g; % rzut gradientu na kierunek poszukiwania (musi byc ujemny)
opt.maxstep = 100; % maksymalny krok
[xopt,fopt] = line_search('obj_fun',x0,sd,opt,T);
xopt
fopt % wartosc funkcji po minimalizacji kierunkowej

g = obj_fun_grad(xopt) % gradient po minimalizacji kierunkowej 
% w tym przyk�adzie kierunek poszukiwania jest tak 
% dobrany, �e minimum na kierunku jest jednocze�nie minimum globalnym 
