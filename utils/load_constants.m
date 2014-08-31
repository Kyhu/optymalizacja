%% Zmienne globalne
global psi;     % Przebieg rownan sprzezonych
global psit;    % Czas do przebiegu rownan sprezonych
global phi;     % Funkcja przelaczen

%% Parametry
% Predkosc katowa ziemi
global w0;
w0 = 2*pi/86400;

% Promien orbity geostacjonarnej
global R0;      
R0 = 42242;

% Masa statku w kg
global m;       
m = 10000;

% Sterowanie maksymalne
global u_max;
u_max = 1;

% Czas koncowy
global T;
T = 50;

% Siła ciagu silnika w niutonach
global F;
F = 2000;

% Liczba punktow czasowych miedzy 0 a T
global nt;
nt = 2000;

% Poczatkowy stan obiektu
global x0;
x0 = zeros(1,7);

% Sterowanie w chwili t = 0;
global u0;
u0 = [u_max,u_max,u_max];

