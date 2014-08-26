% Symboliczne wyliczenie psi(T). Czyli punktu startu calkowania wstecz.
syms('lambda', 'real')
syms('x1', 'real')
syms('x2', 'real')
syms('x3', 'real')
syms('x4', 'real')
syms('x5', 'real')
syms('x6', 'real')
syms('x7', 'real')

Q = T + lambda*x7 + x1^2 + x2^2 + x3^2 + x4^2 + x5^2 + x6^2;

psiT1 = -diff(Q,x1)
psiT2 = -diff(Q,x2)
psiT3 = -diff(Q,x3)
psiT4 = -diff(Q,x4)
psiT5 = -diff(Q,x5)
psiT6 = -diff(Q,x6)