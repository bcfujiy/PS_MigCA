% Alvarez-Lucas Algorithm for Wages

function[omega_hat_o,rho_hat_o,Pi_prime,omega_crit,omega_iter] = alg_wages(Pi,beta,theta,omega_tol,...
    rho_tol,max_iter,N,v,y,dM_prime,d_prime,T_hat,alpha)

    omega_hat_i = ones(N,1); % initial guess
    omega_crit = 10^3;
    omega_iter = 0;
    while omega_crit > omega_tol & omega_iter < max_iter
        omega_iter = omega_iter + 1;


        % Sub section for for prices
        rho_tilde_o = alg_prices(omega_hat_i,Pi,beta,theta,rho_tol,max_iter,N,T_hat);

        % Once it converges, we got the implied price changes in:
        rho_hat_o = exp(rho_tilde_o);
        temp3 = T_hat.*((omega_hat_i.^beta).*(rho_hat_o.^(1-beta))).^(-theta);
        temp4 = Pi.*(ones(N,1)*temp3');
        temp5 = temp4*ones(N,1);
        Pi_prime = temp4./(temp5*ones(1,N));

        % Now we construct the excess demand function,
        % as a function of omega_hat_i

        temp6 = Pi_prime'*(alpha.*(omega_hat_i.*y + d_prime ...
            - (1-beta)*(dM_prime./alpha)));
        temp7 = alpha.*(omega_hat_i.*y + d_prime - (dM_prime./alpha));
        Z = (temp6 - temp7)./omega_hat_i;

        omega_hat_o = omega_hat_i.*(1+v*Z./y);
        omega_crit = sum(abs(omega_hat_i - omega_hat_o));
        omega_hat_i = omega_hat_o;
    end