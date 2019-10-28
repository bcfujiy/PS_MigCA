%%% Simulated data, aggregates

% Keeping only the last 5 periods
Tkeep = 5;

% Earnings
earn = zeros(I, J, K, Tkeep);

for k = 1:K
    for t = 1:Tkeep
        earn(:, :, k, t) = reshape(kron(wages(:, k, (T - Tkeep) + t), ...
            s_ikt(:, k, (T - Tkeep) + t)), [I J]);
    end
end

% Lagged labor allocations
L_iktlag = L_jkt(:, :, T - Tkeep:T - 1);

% Dimension indexes
dim_i = kron(linspace(1, I, I)', ones(J*K*Tkeep, 1));
dim_j = kron(ones(I, 1), kron(linspace(1, J, J)', ones(K*Tkeep, 1)));
dim_k = kron(ones(I*J, 1), kron(linspace(1, K, K)', ones(Tkeep, 1)));
dim_t = kron(ones(I*J*K, 1), linspace(1, Tkeep, Tkeep)');
dims = [dim_i dim_j dim_k dim_t];

% Vectorization of variables
earn_vec = vec(permute(earn, [4 3 2 1]));
L_iktlag_vec = vec(repmat(permute(L_iktlag, [3 2 1]), 1, J));
L_ijkt_vec = vec(permute(L_ijkt(:, :, :, T - Tkeep + 1:T), [4 3 2 1]));

% Exporting data
simulated_aggreg = [dims earn_vec L_ijkt_vec L_iktlag_vec];
csvwrite('../../outputs/simulated_aggreg_mod1.csv', simulated_aggreg);