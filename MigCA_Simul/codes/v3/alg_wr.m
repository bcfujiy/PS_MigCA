%%% Algorithm to find w_{j, kt} and r_{j, t}

function [w_o, r_o, P_jx, X_ikx, H_ix] = alg_wr(I, J, K, w_crit, ...
    r_crit, wr_tol, max_iter, Hbar_ix, b_ix, A_ikx, tau_ijkx, a_kx, ...
    E_jkx, zeta, gamma_k, kappa_pi, eta, sigma, v)

    % Initial guess for w and r
    w_i = ones(I, K);
    r_i = ones(I, 1);
    
    % Seed for number of iterations
    wr_iter = 0;
    
    % Costs (to be filled)
    c_ikx = zeros(I, K);
    
    % Loop
    while w_crit > wr_tol && r_crit > wr_tol && wr_iter < max_iter
        
        % Update number of iteration
        wr_iter = wr_iter + 1;
        
        % Supply of land
        H_ix = ((r_i.^(zeta))./(b_ix + r_i.^(zeta))).*Hbar_ix;
        
        % Cost shares
        for k = 1:K
            c_ikx(:, k, :) = (w_i(:, k).^(1 - gamma_k(k)))...
                .*(r_i.^(gamma_k(k)))./(kappa_pi(k));
        end
                
        % Cost, trade costs and productivity -> Price index, ijkt
        P_ijkx = permute((c_ikx./A_ikx).*permute(tau_ijkx, [1 3 2]), ...
            [1 3 2]);
        
        % Price index, jkx
        P_jkx = (reshape(sum(P_ijkx.^(1 - eta), 1), [J K])).^((1)/(1 - eta));

        % Price index, jx
        P_jx = (sum(a_kx'.*(P_jkx.^(1 - sigma)), 2)).^((1)/(1 - sigma));
        
        % Total nominal expenditure in region j
        X_jx = sum(w_i.*E_jkx, 2) + r_i.*H_ix;
        
        % Total real expenditure in region j
        Q_jx = X_jx./P_jx;
        
        % Price ratio 1
        P_ratio1 = (permute(permute(P_ijkx, [2 3 1])./P_jkx, ...
            [3 1 2])).^(-eta);
        
        % Price ratio 2
        P_ratio2 = (P_jkx./P_jx).^(-sigma);
       
        % Real demand, ijkt
        q_ijkx = permute(permute(permute(P_ratio1, [2 3 1]).*P_ratio2.*...
            Q_jx, [2 3 1]).*a_kx, [2 3 1]);
        
        % Nominal demand, ijkt
        X_ijkx = q_ijkx.*P_ijkx;
        
        % Nominal demand, ikt
        X_ikx = reshape(sum(X_ijkx, 2), [I K]);
        
        % New rental rate
        %r_o = (sum(gamma_k.*X_ikx', 1)')./H_ix;
        r_o_log = log(sum(gamma_k.*X_ikx', 1)') - log(H_ix);
        
        % New wages
        %w_o = ((1 - gamma_k).*X_ikx')'./E_jkx;
        w_o_log = log((1 - gamma_k).*X_ikx')' - log(E_jkx);

        % Rental rates and wages pegged to numeraire
        %r_o = r_o./w_o(1, 1);
        %w_o = w_o./w_o(1, 1);
        r_o_log = r_o_log - w_o_log(1, 1);
        w_o_log = w_o_log - w_o_log(1, 1);
        
        % Critical values
        %r_crit = max(abs(r_o - r_i));
        %w_crit = max(max(abs(w_o - w_i)));
        r_crit = max(abs(exp(r_o_log) - r_i));
        w_crit = max(max(abs(exp(w_o_log) - w_i)));
        
        % Update
        %r_i = r_i.*exp(v.*(r_o - r_i));
        %w_i = w_i.*exp(v.*(w_o - w_i));
        r_i = r_i.*exp(v.*(r_o_log - log(r_i)));
        w_i = w_i.*exp(v.*(w_o_log - log(w_i)));
        
    end
    
    r_o = exp(r_o_log);
    w_o = exp(w_o_log);