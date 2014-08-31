path('BFGS/', path); % sciezka do BFGSa
path('line_search/', path); % sciezka do line searcha
path('quality_index/', path); % sciezka do wskaznika jakosci
path('model/', path); % sciezka do rownan stanu razem z rk4 i approkysmacja calego przebiegu
path('utils/', path); % sciezka do pomocnych narzedzi

clear_all_but_bp;
load_constants;

%% Test rk4 i appro
% t0 = 0;  
% tn = 30; % (t0, tn) - ca�kowity przedzia� czasu
% u = [1 -10 5 20 0 0; 0 1 0 -1 0 0;0 2 5 -5 2 0]; %losowe wsp�czynniki sterowania
% x0 = [0 0 0 0 0 0 0];  % punk startowy
% q = 100; % liczba punktow w podprzedziale
%     
% [t,x] = appr([t0 tn], u, x0, @rhs_SRV, 100);  
% 
% figure(1);
% plot(t,x); 


%% Test samego line_searcha (mimum tych funkcji to 2 i 3 ale prosta nie przechodzi dokladnie przez ten punkt));
% x0 = [6 7]'; % punkt startowy
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
% BFGS([35;12], @obj_fun, @obj_fun_grad)

Tau = [20 25;30 35 ;35 40];
Tau_vec = reshape(Tau,[],1);
Tau_vec = BFGS(Tau_vec, @qi_tau_wrapper, @qi_tau_grad);
Tau = reshape(Tau_vec,3,[])

%% Test calkowanie wstecz
% Tau = [2,5,7,36,46; 7,10,22,37,40; 15,16,24,32,45];
% point_number = 50000;
% [t, u] = tau2u(Tau);
% [t,x] = appr([t(1) t(end)], u, x0, @rhs_SRV, 1);  
% figure(1)
% plot(strech_vector(t,point_number),strech_vector(x,point_number)); 
% u = flipud(u); % Obrócenie x bo będziemy calkować w tyl.
% x_back0 = x(end,:);
% [t_back,x_back] = appr([t(end) t(1)], u, x_back0, @rhs_SRV, 1);   % Czas obrocony
% x_back = flipud(x_back);
% t_back = flipud(t_back);
% 
% figure(2);
% plot(strech_vector(t,point_number),strech_vector(x_back,point_number)); 
% 
% qi_prim = qi_x_grad(x);
% psiT = -qi_prim(end,:); 
% x = flipud(x); 
% [psit,psi] = appr([t(end) t(1)], x, psiT, @psi_rhs_SRV, 1);   
% psi = flipud(psi);
% psit = flipud(psit);
% figure(3);
% plot(strech_vector(t,point_number),strech_vector(psi,point_number));

%% Test funkcji przelaczajacej
% Tau = [2,5,7,36,46; 7,10,22,37,40; 15,16,24,32,45];
% [t,u] = tau2u(Tau);
% plot(t,u);

%% Test qi_tau
% Tau = [1:49;1:49;1:49];
% qi_tau(Tau)

%% Test qi_tau_grad
%Przykladowe psi
% global psit psi;
% load('random_psi.mat')
% psi = x;
% psit = tx;
% clear tx x;
% Tau = [2,5,7,36,46; 7,10,22,37,40; 15,16,24,32,45];
% qi_tau_grad(Tau)

%% Test remove_pins
% Tau = [2,5,7,36, 36.03,46; 7,10,22,22,37,40; 15,16,16.04,24,32,45];
% remove_pins(Tau)

%% Test generate_switch - do zrobienia
% Tau = [2,5,7,36,46; 7,10,22,37,40; 15,16,24,32,45];
% generate_switch(Tau)

