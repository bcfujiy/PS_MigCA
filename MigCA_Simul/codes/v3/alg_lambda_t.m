%%% Algorithm to find each lambda

function [lambda_o, w_o, r_o, E_jkx, X_ikx, H_ix, s_ikx, P_jx, ...
    welf_ijkx] = alg_lambda_t(I, J, K, lambda_crit, lambda_tol, ...
    max_iter, lambda_i, L_ixlag, L_ikxlag, Hbar_ix, b_ix, A_ikx, ...
    tau_ijkx, mu_ijkx, a_kx, sbar_k, beta, w_crit, r_crit, wr_tol, ...
    zeta, gamma_k, kappa_pi, eta, sigma, v, kappa, phi)
    
    % Seed for number of iterations
    lambda_iter = 0;
    
    % Getting labor allocations and migration flows from lambda guess
    L_ijkx = lambda_i.*L_ixlag;
        
    % Worker's knowledge
    s_ikx = sbar_k'.*((L_ikxlag).^(beta));
    
    % Effective labor supply
    E_ijkx = permute(s_ikx.*permute(L_ijkx, [1 3 2]), [1 3 2]);
    E_jkx = reshape(sum(E_ijkx, 1), [J, K]);
    
    % Welfare numerator (to be filled)
    welf_num = zeros(I, J, K);
    
    % Loop
    while lambda_crit > lambda_tol && lambda_iter < max_iter
        
        % Update number of iteration
        lambda_iter = lambda_iter + 1;
        
        % Getting w_{j, kt} and r_{j, t} given Lambda guess
        [w_o, r_o, P_jx, X_ikx, H_ix] = alg_wr(I, J, K, w_crit, r_crit, ...
            wr_tol, max_iter, Hbar_ix, b_ix, A_ikx, tau_ijkx, a_kx, ...
            E_jkx, zeta, gamma_k, kappa_pi, eta, sigma, v);
        
        % Welfare numerator, ijkt
        for k = 1:K
            welf_num(:, :, k) = reshape(kron(w_o(:, k), s_ikx(:, k)), [I J]);
        end
        
        % Welfare denomiator, ijkt
        welf_den = mu_ijkx.*P_jx';
        
        % Welfare, ijkt
        welf_ijkx = welf_num./welf_den;
        
        % Lambda output numerator
        lambda_o_num = welf_ijkx.^kappa;
        
        % Lambda output denomiator
        lambda_o_den = sum(sum(lambda_o_num, 2), 3);
        
        % Lambda output
        lambda_o = lambda_o_num./lambda_o_den;
        
        % Critical values
        lambda_crit = max(max(max(abs(lambda_o - lambda_i))));
        
        % Update
        lambda_i = phi.*lambda_o + (1 - phi).*lambda_i;
        
    end