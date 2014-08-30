% Symboliczne wyliczenie rownan psi (Sprzezonych funkcji)

syms('x1', 'real')
syms('x2', 'real')
syms('x3', 'real')
syms('x4', 'real')
syms('x5', 'real')
syms('x6', 'real')
syms('x7', 'real')
syms('r_mod', 'real')
syms('a1', 'real')
syms('a2', 'real')
syms('a3', 'real')
syms('psi1', 'real')
syms('psi2', 'real')
syms('psi3', 'real')
syms('psi4', 'real')
syms('psi5', 'real')
syms('psi6', 'real')
syms('psi7', 'real')
syms('f1', 'real')
syms('f2', 'real')
syms('f3', 'real')
syms('f4', 'real')
syms('f5', 'real')
syms('f6', 'real')
syms('f6', 'real')
syms('f7', 'real')

r_mod = sqrt((x1+1)^2 + x2^2 + x3^3)^(-3);

f1 = x4
f2 = x5
f3 = x6
f4 = 2*x5 + (1+x1)*(1-r_mod^(-3)) + a1
f5 = -2*x4 + x2*(1-r_mod)+a2
f6 = -x3*r_mod+a3
f7 = sqrt(a1^2 + a2^2 + a3^2);

H = psi1 * f1 + psi2 * f2 + psi3*f3 + psi4*f4 + psi5*f5 + psi6*f6 + psi7*f7

dpsi1 = -diff(H, x1)
dpsi2 = -diff(H, x2)
dpsi3 = -diff(H, x3)
dpsi4 = -diff(H, x4)
dpsi5 = -diff(H, x5)
dpsi6 = -diff(H, x6)
dpsi7 = -diff(H, x7)


% pretty(dpsi1);
% pretty(dpsi2);
% pretty(dpsi3);
% pretty(dpsi4);
% pretty(dpsi5);
% pretty(dpsi6);
% pretty(dpsi7);