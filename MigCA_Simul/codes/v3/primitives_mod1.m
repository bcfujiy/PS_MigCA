%%% Primitives of the model

% Dimensions (smaller scale to make the program run faster)
I = 50; % Number of origin regions, page 8
J = I; % Number of destination regions
K = 10; % Number of sectors, page 26, table 5
T = 30; % Number of periods (1980-2010), page 18

% Initial labor allocations (mass = 1)
L_ik0 = ones(I, K)./(I*K);
L_i0 = sum(L_ik0, 2);

% Labor allocations and migration flows (to be filled)
L_ijkt = zeros(I, J, K, T);
L_jkt = zeros(J, K, T);
L_jt = zeros(J, T);

% Lambdas (to be filled)
lambdas = zeros(I, J, K, T);

% Wages and rental rates (to be filled)
wages = zeros(I, K, T);
rentals = zeros(I, T);

% Effective labor supply (to be filled)
E_jkt = zeros(J, K, T);

% Expenditures (to be filled)
X_ikt = zeros(I, K, T);

% Worker's knowledge
s_ikt = zeros(I, K, T);

% Land (to be filled)
H_it = zeros(I, T);

% Aggregate prices (to be filled)
P_jt = zeros(J, T);

% Welfare (to be filled)
welf_ijkt = zeros(I, J, K, T);

% Geography
scale = zeros(I, K, T); % Scale parameter (Absolute advantage)
scale(:, :, 1) = rand(I, K);

for t = 2:T
    scale(:, :, t) = scale(:, :, 1);
end

shape = 2; % Shape parameter (Comparative advantage)
locat = 0.01; % Location parameter (to make sure we don't divide by zero)
A_draws = rand(I, K, T);
A_draws(:, :, 1) = rand(I, K);

for t = 2:T
    A_draws(:, :, t) = A_draws(:, :, 1);
end

A_ikt = (log(A_draws.^(-1./scale))).^(-1/shape) + locat; % Productivity - Frechet + 0.01 to make sure we don't divide by zero
Hbar_it = ones(I, T); % Total land endowments
b_it = ones(I, T); % Opportunity use of land
tau_ijkt = zeros(I, J, K, T); % Bilateral trade costs
tau_ijkt = ones(I, J, K, 1) + rand(I, J, K, 1)*0.5;

for t = 2:T
    tau_ijkt(:, :, :, t) = tau_ijkt(:, :, :, 1);
end

mu_m = 1;
mu_v = 0.1;
mu_mu = log((mu_m^2)/sqrt(mu_v + mu_m^2));
mu_sigma = sqrt(log(mu_v/(mu_m^2) + 1));
mu_ijkt = ones(I, J, K, 1) + lognrnd(mu_mu, mu_sigma, [I, J, K, 1]); % Bilateral migrations costs

for t = 2:T
    mu_ijkt(:, :, :, t) = mu_ijkt(:, :, :, 1);
end

for i = 1:I
    mu_ijkt(i, i, :, :) = 1; % mu_iikt = 1, forall i
end

% Worker's knowledge
sbar_k = ones(K, 1);

% Preference shifter
a_kt = ones(K, T);

% Parameters
beta = 0; % Assuming beta = 0 in this case
zeta = 2.8; % Partial elasticity of land supply, page 35
kappa = 1.25; % Parameter related to Fact 2, page 35
eta = 9.5; % CES pref across varieties within sectors, page 35
sigma = 2.5; % CES pref across sectors, page 35
gamma_k = rand(K, 1); % Value added share of land, arbitrary
gamma_k = gamma_k/sum(gamma_k); % Normalize for gammas to sum 1
kappa_pi = gamma_k.^((gamma_k)./(1 - gamma_k));
v = 0.001; % Dampening factor
phi = 0.5; % Updating factor for lambda

% Tolerance parameters for the algorithm
max_iter = 10^6; % Maximum number of iterations in any loop
lambda_tol = 10^(-5); % Tolerance in lambda iteration
wr_tol = 10^(-5); % Tolerance in wage-rentalrate iteration
lambda_crit = 10^3; % Critical values for lambdas
w_crit = 10^3; % Critical values for wages
r_crit = 10^3; % Critical values for rental rates
