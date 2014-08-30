global w0;
global R0;
global m;
global u_max;
global T;
global nt;
global x0;
global psi; % Przebieg rownan sprzezonych
global psit; % Czas do rownan sprezonych
global phi; % Funkcja przelaczen
global u0; % Od jakiego sterowania zaczynamy

u_max = 1; %??
nt = 1000; %?? - liczba punktow czasowych miedzy 0 a T
x0 = zeros(1,7);
%x0 = [1,0,0];
u0 = [1,1,1];

w0 = 1;
R0 = 1;
T = 50;
m = 1;

% qi tau grad testing
% load('random_psi.mat')
% psi = x;
% psit = tx;
% clear tx x;
