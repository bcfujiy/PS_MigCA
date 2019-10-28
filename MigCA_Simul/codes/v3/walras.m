%%% Walras

%%% Market for efficiency units of labor %%%

% LHS
labor_lhs = wages.*E_jkt;

% RHS
labor_rhs = (1 - gamma_k)'.*X_ikt;

% Equal?
labor_diff = labor_lhs - labor_rhs;

%%% Land market %%%

% LHS
land_lhs = rentals.*H_it;

% RHS
land_rhs = squeeze(sum(gamma_k'.*X_ikt, 2));

% Equal?
land_diff = land_lhs - land_rhs;
