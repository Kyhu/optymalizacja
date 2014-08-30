syms('x1', 'real')
syms('x2', 'real')
syms('x3', 'real')
syms('x4', 'real')
syms('x5', 'real')
syms('x6', 'real')
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
syms('f7', 'real')

r_mod = sqrt((x1+1)^2 + x2^2 + x3^2)

f1 = x3
f2 = x4
f3 = x5
f4 = 2*x5 + (1+x1)*(1-r_mod^(-3)) + a1
f5 = -2*x4 + x2*(1-r_mod)+a2
f6 = -x3*r_mod+a3
f7 = sqrt(a1^2 + a2^2 + a3^2)


H = psi1 * f1 + psi2 * f2 + psi3*f3 + psi4*f4 + psi5*f5 + psi6*f6 +  psi7*f7

dQ1 = -diff(H, a1)
dQ2 = -diff(H, a2)
dQ3 = -diff(H, a3)

% pretty(dQ1);
% pretty(dQ2);
% pretty(dQ3);
