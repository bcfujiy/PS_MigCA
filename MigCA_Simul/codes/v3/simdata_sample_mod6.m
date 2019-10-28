%%% Simulated data, sampled

% Population and sampling size
M = 120000; % Number of people in 1980 in Brazil = 120,000,000 (thousands)
sampsize = [0.05 0.1 0.25 0.5 1]; % Vector of sample sizes

% Taste shocks (Frechet)
taste_draws = rand(M, I*K, T);
taste = (-log(taste_draws)).^(-(1/kappa));

% Productivity draws
nu_m = 1;
nu_v = 10;
nu_mu = log((nu_m^2)/sqrt(nu_v + nu_m^2));
nu_sigma = sqrt(log(nu_v/(nu_m^2) + 1));
nu_ijkt = lognrnd(nu_mu, nu_sigma, [I, J, K, T]);

% Lagged labor allocations
L_itlag = reshape(sum(L_iktlag, 2), [I T]);

% Matrix of equivalences: which column of the 'choices' matrix correspond
% to destination/sector
equiv = [linspace(1, J*K, J*K)' repelem(linspace(1, J, J), K)' ...
    repmat(linspace(1, K, K), 1, J)'];

% Full dataset
simulated_sampled_all = [];

% Loop across sample sizes and periods
for x = 1:size(sampsize, 2)
    
    % Determine sample size
    N_s = sampsize(x);
    
    % Sample matrix (to be filled)
    sample = [];

    % Empty matrixes to be filled in each loop
    choices = zeros(M, J*K); % Rows are people, columns are (j,k) pairs
    destin = zeros(M, 2); % destination/crop
    pop_wages = zeros(M, 1);
    pop_knowl = zeros(M, 1);
    pop_rhs = zeros(M, 1);
    
    for t = 1:T
        
        % Origin regions
        origin = randsample(linspace(1, I, I)', M, true, L_itlag(:, t));

        % Matrix of welfare by individuals and their locations/sectors
        for m = 1:M
            choices(m, :) = vec(permute(welf_ijkt(origin(m), :, :, t).*...
                nu_ijkt(origin(m), :, :, t), [3 2 1]))';
        end

        choices = choices.*taste(:, :, t);

        % Location and sector that maximizes total welfare
        [choices_max, choices_argmax] = max(choices, [], 2);

        % Find destination and sector
        for m = 1:M
            destin(m, :) = equiv(choices_argmax(m), 2:end);
        end

        % Wages and knowledge that corresponds to each optimal choice
        for m = 1:M
            pop_wages(m) = wages(destin(m, 1), destin(m, 2), t);
            pop_knowl(m) = s_ikt(origin(m), destin(m, 2), t);
            %pop_rhs(m) = L_iktlag(origin(m), destin(m, 2), t);
            pop_rhs(m) = L_iktlag(destin(m, 1), destin(m, 2), t);
        end

        % Database and sample
        pop = [origin destin ones(M, 1).*t pop_wages pop_knowl pop_rhs];
        sample_t = pop(rand(M, 1) <= N_s, :);

        % Storing sample
        sample = [sample; sample_t];
        
    end
    
    % Migration flows from the sample
    sample_L_ijkt = crosstab(sample(:, 1), sample(:, 2), sample(:, 3), sample(:, 4));
    sample_L_ijkt = sample_L_ijkt./sum(sum(sum(sample_L_ijkt, 1), 2), 3);

    % Lagged labor allocations from the sample
    %sample_L_jkt = reshape(sum(sample_L_ijkt, 1), [J, K, T]);
    sample_L_jkt = squeeze(sum(sample_L_ijkt, 1));
    sample_L_iktlag = sample_L_jkt(:, :, 1:T - 1);

    % Sample wages (zero for regions there is no people)
    %sample_L_jkt = reshape(sum(sample_L_ijkt, 1), [J K T]);
    sample_wages = wages;
    %sample_wages(find(sample_L_jkt == 0)) = 0;

    % Sample worker's knowledge
    sample_s_ikt = s_ikt;

    % Sample earnings
    sample_earn = zeros(I, J, K, T);

    for k = 1:K
        for t = 1:T
            sample_earn(:, :, k, t) = reshape(kron(sample_wages(:, k, t), ...
                sample_s_ikt(:, k, t)), [I J]);
        end
    end
    
    sample_earn = sample_earn.*nu_ijkt;
    sample_earn(find(sample_L_ijkt == 0)) = 0;

    % Dropping first period such that we can put the lagged variable in the
    % regressions
    sample_earn = sample_earn(:, :, :, 2:T);
    sample_L_ijkt = sample_L_ijkt(:, :, :, 2:T);
    L_ijkt_crop = L_ijkt(:, :, :, 2:T);
    L_iktlag_crop = L_iktlag(:, :, 2:T);
    dims(dims(:, 4) == 1, :) = [];

    % Vectorization of variables
    sample_earn_vec = vec(permute(sample_earn, [4 3 2 1]));
    sample_L_ijkt_vec = vec(permute(sample_L_ijkt, [4 3 2 1]));
    sample_L_iktlag_vec = vec(repmat(permute(sample_L_iktlag, [3 2 1]), 1, J));
    L_ijkt_crop_vec = vec(permute(L_ijkt_crop, [4 3 2 1]));
    L_iktlag_crop_vec = vec(repmat(permute(L_iktlag_crop, [3 2 1]), 1, J));    

    % Forming data
    simulated_sampled = [ones(size(sample_earn_vec, 1), 1).*x dims ...
        sample_earn_vec sample_L_ijkt_vec sample_L_iktlag_vec ...
        L_ijkt_crop_vec L_iktlag_crop_vec];
    
    % Stacking it
    simulated_sampled_all = [simulated_sampled_all; simulated_sampled];
    
end

% Exporting data
csvwrite('../../outputs/simulated_sampled_all_mod6.csv', simulated_sampled_all);
