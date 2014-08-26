close all;

path('BFGS/', path); % sciezka do BFGSa
path('line_search/', path); % sciezka do line searcha
path('quality_index/', path); % sciezka do wskaznika jakosci
path('model/', path); % sciezka do rownan stanu razem z rk4 i approkysmacja calego przebiegu
load_constants;

%% Test rk4 i appro
% t0 = 0;  
% tn = 30; % (t0, tn) - ca�kowity przedzia� czasu
% u = [1 -10 5 20 0 0; 0 1 0 -1 0 0;0 2 5 -5 2 0]; %losowe wsp�czynniki sterowania
% x0 = [0 0 0 0 0 0 0];  % punk startowy
% q = 100; % liczba punktow w podprzedziale
% figure(1);
%     
% [t,x] = appr([t0 tn], u, x0, @rhs_SRV, 100);  
% plot(t,x); 


%% Test samego line_searcha (mimum tych funkcji to 2 i 3 ale prosta nie przechodzi dokladnie przez ten punkt));
% x0 = [7 10]'; % punkt startowy
% sd = [1 1]' - x0; % kierunek poszukiwania
% T = 1; % nie uzywamy, ale bedzie potrzebne przy innych zadaniach (?)
% f0 = obj_fun(0,x0,sd,T); % wartosc funkcji celu w punkcie poczatkowym
% g = obj_fun_grad(x0); % gradient w x0
% opt.f0 = f0; % poczatkowa wrtosc do struktury opt
% opt.gradd = sd'*g; % rzut gradientu na kierunek poszukiwania (musi byc ujemny)
% opt.maxstep = 100; % maksymalny krok
% [xopt,fopt] = line_search(@obj_fun,x0,sd,opt,T);
% xopt
% fopt % wartosc funkcji po minimalizacji kierunkowej

%% Test BFGSa i line searcha (mimum tych funkcji to 2 i 3);
% BFGS([-10; 15605], @obj_fun, @obj_fun_grad)

% Calkowanie wstecz - trzeba tez odkomentowac rk4 i appro - cos w tym nie dziala
% x = flipud(x); % Obrócenie x bo będziemy calkować w tym.
% psiT = [-2*x(1,1),-2*x(1,2),-2*x(1,3),-2*x(1,4),-2*x(1,5),-2*x(1,6),-1]; %poczoatkowe/koncowe psi
% [psit,psi] = appr([tn t0], x', psiT, @psi_rhs_SRV, 1);   % Czas obrocony
% psi = flipud(psi); % Obracamy do chronologicznej kolejnosci
% figure(2);
% plot(flipud(psit),psi); 

%% Test funkcji przelaczajacej
% Tau = [2,5,7,36,46; 7,2,8,15,1; 15,16,4,12,45];
% [t,u] = switch_fun(Tau);
% plot(t,u);

%% Test qi_tau
% Tau = [25;25;25];
% qi_tau(Tau)

%% Test qi_tau 2
Tau = [0.1,2];
qi_tau(Tau)

%% Test qi_tau_grad
% Tau = [2,5,7,36,46; 7,2,8,15,1; 15,16,4,12,45];
% qi_tau_grad(Tau)



