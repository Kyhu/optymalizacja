function dx = rhs(t, x, u)
% Testowe rownanie
dx(1) = x(2);
dx(2) = x(3);
dx(3) = u;
