function dpsi = psi_rhs_SRV(t, psi, x)
% Rownania sprzezone, wyliczone symbolicznie
% Czy potrzebne nam 't' w argumencie funkcji?

dpsi(1) = 0;
dpsi(2) = -psi(1);
dpsi(3) = -psi(2);
