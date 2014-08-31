%% Zapisuje breakpointy, czysci tymczasowe dane, wczytuje breakpointy

% Zapisz breakpoimtu
tmp = dbstatus;
save('tmp.mat','tmp')

% clear all
close all
clear classes %# clears even more than clear all
%clc

% Wczytaj breakpointy
load('tmp.mat')
dbstop(tmp)

% clean up
clear tmp
delete('tmp.mat')