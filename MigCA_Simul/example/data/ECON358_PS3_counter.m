%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ECON 358 - QUANTITATIVE ANALYSIS IN TRADE
% PROBLEM SET 3
% This code calculates the counterfactuals in required in questions 3
% and 4 of the problem set
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
clc


% Parameter values
N = 20;
max_iter = 10^5;
rho_tol = 10^(-6);
omega_tol = 10^(-6);
theta = 8.23;
beta = .312;
v = 0.01;

% Counterfactual values
dM_prime = 0*ones(N,1); % vector of mfg. deficits relative to world GDP
d_prime = dM_prime; % vector of overall deficits relative to world GDP


% Importing data from STATA
Y = importdata('Y.raw'); % GDP
YM = importdata('YM.raw'); % Gross production of manufactures
DM = importdata('DM.raw'); % Deficit in manufactures
X = importdata('X.raw'); % Overall absorption
XM = importdata('XM.raw'); % Absorption of manufactures
alpha = importdata('alpha.raw'); %Share of manufactures

pi_ni = importdata('pi_ni.raw'); % Pi matrix in vector form


% Transforming the data into normalized values
Y_world = sum(Y);
y = Y/Y_world;
dM = DM/Y_world;
yM = YM/Y_world;


% Transforming the vector into a matrix
Pi = reshape(pi_ni,N,N);
Pi = Pi';


% Main loop, looks for omega_hat that solves the system




omega_hat_i = ones(N,1); % initial guess
omega_crit = 10^3;
omega_iter = 0;
while omega_crit > omega_tol & omega_iter < max_iter
    omega_iter = omega_iter + 1;
    

    % Sub section for for prices
    rho_hat_i = .5*ones(N,1); % initial guess (always converges)
    rho_tilde_i = log(rho_hat_i);
    omega_tilde_i = log(omega_hat_i);
    rho_crit = 10^3;
    rho_iter = 0;
    while rho_crit > rho_tol & rho_iter < max_iter
        rho_iter = rho_iter + 1;
        temp2 = Pi*exp(-theta*(beta*omega_tilde_i +(1-beta)*rho_tilde_i));
        rho_tilde_o = (-1/theta)*log(temp2);
        rho_crit = norm((rho_tilde_o - rho_tilde_i)./rho_tilde_i, inf);
        rho_tilde_i = rho_tilde_o;
    end
    % Once it converges, we got the implied price changes in:
    rho_hat_o = exp(rho_tilde_o);
    temp3 = ((omega_hat_i.^beta).*(rho_hat_o.^(1-beta))).^(-theta);
    temp4 = ones(N,1)*temp3';
    temp5 = Pi*temp3*ones(1,N);
    Pi_prime = Pi.*temp4./temp5;


    % Now we construct the excess demand function,
    % as a function of omega_hat_i

    temp6 = omega_hat_i.*y + d_prime - (1-beta)*(dM_prime./alpha);
    temp7 = Pi_prime.*(temp6*ones(1,N));
    temp8 = omega_hat_i.*y + d_prime - (dM_prime./alpha);
    Z = ((sum(temp7,1))'- temp8)./omega_hat_i;

    omega_hat_o = omega_hat_i.*(1+v*Z./y);
    omega_crit = norm((omega_hat_o - omega_hat_i)./omega_hat_i,inf);
    omega_hat_i = omega_hat_o;
end
% The algorithm stops here

% The change in real GDP is:
Yr_change = (omega_hat_i./rho_hat_o).^(alpha);

clear temp2 temp3 temp4 temp5 temp6 temp7 temp8 *_tol