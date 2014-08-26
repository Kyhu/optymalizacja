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

w0 = 1; %??
R0 = 1; %??
m = 1; %??
u_max = 1; %??
T = 1; %??
nt = 100; %?? - liczba punktow czasowych miedzy 0 a T
%x0 = zeros(1,7);
x0 = [1,0,0];
u0 = -1;

psi = [0:0.01:1,0:0.01:1,0:0.01:1];
psit = [0:1];

% Do testow - wywalic jak bedizemy mieli wylicanie psi
% load random_psi x tx;
% psi = x;
% psit = tx;
% clear x tx;