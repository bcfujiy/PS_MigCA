%%% Algorithm to find all lambdas

function [lambdas, L_ijkt, L_jkt, L_jt, wages, rentals, E_jkt, X_ikt, ...
    H_it, s_ikt, P_jt, welf_ijkt] = alg_lambdas(I, J, K, T, L_ik0, ...
    L_i0, Hbar_it, b_it, A_ikt, tau_ijkt, mu_ijkt, a_kt, sbar_k, beta, ...
    lambda_crit, lambda_tol, max_iter, w_crit, r_crit, wr_tol, zeta, ...
    gamma_k, kappa_pi, eta, sigma, v, kappa, phi, E_jkt, X_ikt, H_it, ...
    s_ikt, P_jt)

    %%% Finding equilibrium lambda_ijk1 %%%
    
    % Guess
    lambda_i = ones(I, J, K)./(J*K);
    
    % Inputs for the loop
    L_ixlag = L_i0;
    L_ikxlag = L_ik0;
    Hbar_ix = Hbar_it(:, 1);
    b_ix = b_it(:, 1);
    A_ikx = A_ikt(:, :, 1);
    tau_ijkx = tau_ijkt(:, :, :, 1);
    mu_ijkx = mu_ijkt(:, :, :, 1);
    a_kx = a_kt(:, 1);
    
    % Find lambda_ijk1
    [lambda_o, w_o, r_o, E_jkx, X_ikx, H_ix, s_ikx, P_jx, welf_ijkx] = ...
        alg_lambda_t(I, J, K, lambda_crit, lambda_tol, max_iter, ...
        lambda_i, L_ixlag, L_ikxlag, Hbar_ix, b_ix, A_ikx, tau_ijkx, ...
        mu_ijkx, a_kx, sbar_k, beta, w_crit, r_crit, wr_tol, zeta, ...
        gamma_k, kappa_pi, eta, sigma, v, kappa, phi);
    
    % Getting actual migration flows and labor allocations
    L_ijkt(:, :, :, 1) = lambda_o.*L_i0;
    L_jkt(:, :, 1) = sum(L_ijkt(:, :, :, 1), 1);
    L_jt(:, 1) = sum(L_jkt(:, :, 1), 2);
    
    % Store results
    lambdas(:, :, :, 1) = lambda_o;
    wages(:, :, 1) = w_o;
    rentals(:, 1) = r_o;
    E_jkt(:, :, 1) = E_jkx;
    X_ikt(:, :, 1) = X_ikx;
    H_it(:, 1) = H_ix;
    s_ikt(:, :, 1) = s_ikx;
    P_jt(:, 1) = P_jx;
    welf_ijkt(:, :, :, 1) = welf_ijkx;

    %%% Finding equilibrium lambda_ijkt, for 2 <= t <= T %%%
    for t = 2:T
        
        % Guess
        lambda_i = lambdas(:, :, :, t - 1);
        
        % Inputs for the loop
        L_ixlag = L_jt(:, t - 1);
        L_ikxlag = L_jkt(:, :, t - 1);
        Hbar_ix = Hbar_it(:, t);
        b_ix = b_it(:, t);
        A_ikx = A_ikt(:, :, t);
        tau_ijkx = tau_ijkt(:, :, :, t);
        mu_ijkx = mu_ijkt(:, :, :, t);
        a_kx = a_kt(:, t);
        
        % Find lambda_ijkt
        [lambda_o, w_o, r_o, E_jkx, X_ikx, H_ix, s_ikx, P_jx, ...
            welf_ijkx] = alg_lambda_t(I, J, K, lambda_crit, lambda_tol, ...
            max_iter, lambda_i, L_ixlag, L_ikxlag, Hbar_ix, b_ix, ...
            A_ikx, tau_ijkx, mu_ijkx, a_kx, sbar_k, beta, w_crit, ...
            r_crit, wr_tol, zeta, gamma_k, kappa_pi, eta, sigma, v, ...
            kappa, phi);
        
        % Getting actual migration flows and labor allocations
        L_ijkt(:, :, :, t) = lambda_o.*L_jt(:, t - 1);
        L_jkt(:, :, t) = sum(L_ijkt(:, :, :, t), 1);
        L_jt(:, t) = sum(L_jkt(:, :, t), 2);

        % Store result
        lambdas(:, :, :, t) = lambda_o;
        wages(:, :, t) = w_o;
        rentals(:, t) = r_o;
        E_jkt(:, :, t) = E_jkx;
        X_ikt(:, :, t) = X_ikx;
        H_it(:, t) = H_ix;
        s_ikt(:, :, t) = s_ikx;
        P_jt(:, t) = P_jx;
        welf_ijkt(:, :, :, t) = welf_ijkx;
        
    end
    

