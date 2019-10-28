%%% Simulated data, aggregates

% Earnings
earn = zeros(I, J, K, T);

for k = 1:K
    for t = 1:T
        earn(:, :, k, t) = reshape(kron(wages(:, k, t), s_ikt(:, k, t)), [I J]);
    end
end

earn = earn./mu_ijkt;

% Lagged labor allocations
L_iktlag = cat(3, L_ik0, L_jkt(:, :, 1:T-1));

% Dimension indexes
dim_i = kron(linspace(1, I, I)', ones(J*K*T, 1));
dim_j = kron(ones(I, 1), kron(linspace(1, J, J)', ones(K*T, 1)));
dim_k = kron(ones(I*J, 1), kron(linspace(1, K, K)', ones(T, 1)));
dim_t = kron(ones(I*J*K, 1), linspace(1, T, T)');
dims = [dim_i dim_j dim_k dim_t];

% Vectorization of variables
earn_vec = vec(permute(earn, [4 3 2 1]));
L_iktlag_vec = vec(repmat(permute(L_iktlag, [3 2 1]), 1, J));
L_ijkt_vec = vec(permute(L_ijkt, [4 3 2 1]));

% Exporting data
simulated_aggreg = [dims earn_vec L_ijkt_vec L_iktlag_vec];
csvwrite('../../outputs/simulated_aggreg_mod2.csv', simulated_aggreg);