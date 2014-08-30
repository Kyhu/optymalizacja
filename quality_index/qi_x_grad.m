function dq=qi_x_grad(x)
% Gradient funkcji jakosci po stanie obiektu
dq=[2*x(:,1), 2*x(:,2), 2*x(:,3), 2*x(:,4), 2*x(:,5), 2*x(:,6), ones(length(x),1)];
% Wyliczone symbolicznie w sym_grad_qi_x