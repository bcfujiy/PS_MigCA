% Alvarez-Lucas Algorithm for Prices

function[rho_tilde_o] = alg_prices(omega_hat_i,Pi,beta,theta,rho_tol,max_iter,N,T_hat)

rho_hat_i = ones(N,1); % initial guess (always converges)
rho_tilde_i = log(rho_hat_i);
omega_tilde_i = log(omega_hat_i);
rho_crit = 10^3;
rho_iter = 0;
while rho_crit > rho_tol & rho_iter < max_iter
    rho_iter = rho_iter + 1;
    temp2 = Pi*(T_hat.*exp(-theta*(beta*omega_tilde_i +(1-beta)*rho_tilde_i)));
    rho_tilde_o = (-1/theta)*log(temp2);
    rho_crit = sum(abs(exp(rho_tilde_o) - exp(rho_tilde_i)));
    rho_tilde_i = rho_tilde_o;
end
