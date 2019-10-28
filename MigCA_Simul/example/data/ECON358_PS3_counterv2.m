%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% ECON 358 - QUANTITATIVE ANALYSIS IN TRADE
% PROBLEM SET 3
% This code calculates the counterfactuals in required in questions 3
% and 4 of the problem set
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

clear all
clc
close all

% USER DEFINED
% ======================================================================
% ======================================================================
% Parameter values
N = 20; % Number of countries
max_iter = 10^6; % Maximum number of iterations in any loop
rho_tol = 10^(-8); % Tolerance in rho_hat iteration
omega_tol = 10^(-8); % Tolerance in omega_hat iteration
theta = 8.28; % Theta from DEK
beta = .312; % Beta from DEK (2006)
v = 0.001; % Dampening factor

% IMPORTING DATA
% ======================================================================
% ======================================================================
% Importing data from STATA
Y = importdata('Y.raw'); % GDP
X_ni =  importdata('X_ni.raw'); % Mfg. trade flows

% Getting variables out of primitive data
Xni = reshape(X_ni,N,N);
Xni = Xni';

XM = sum(Xni,2);
YM  = sum(Xni,1);
YM = YM';
DM = XM - YM;
D = DM;
X = Y + D;
alpha = (XM-(1-beta)*YM)./X;
Pi = Xni./(XM*ones(1,N));

% Transforming the data into normalized values
Y_world = sum(Y);
y = Y/Y_world;
dM = DM/Y_world;
yM = YM/Y_world;


% ======================================================================
% ======================================================================
% QUESTION 3
% Counterfactual values
dM_prime = 0*ones(N,1); % vector of mfg. deficits relative to world GDP
d_prime = dM_prime; % vector of overall deficits relative to world GDP
T_hat = ones(N,1); % vector of productivities in counterfactual rel. to original

% CODE STARTS RUNNING HERE
% ----------------------------------------------------------------------
tic
% Main loop, looks for omega_hat that solves the system
[omega_hat_o,rho_hat_o,Pi_prime,omega_crit,omega_iter] = alg_wages(Pi,beta,theta,omega_tol,...
    rho_tol,max_iter,N,v,y,dM_prime,d_prime,T_hat,alpha);
% The change in real GDP is:
wr_change = (omega_hat_o./rho_hat_o).^(alpha);
Results3 = [omega_hat_o rho_hat_o wr_change];

clear temp2 temp3 temp4 temp5 temp6 temp7 temp8 
toc
% CODE STOPS HERE
% ----------------------------------------------------------------------

figure(1)
scatter(D./Y,omega_hat_o)
xlabel('Deficit/GDP')
ylabel('change in \omega')
saveas(gcf,'figure1.eps')

figure(2)
scatter(D./Y,wr_change)
xlabel('Deficit/GDP')
ylabel('change in w^R')
saveas(gcf,'figure2.eps')

save 



% ======================================================================
% ======================================================================
% QUESTION 4
% Counterfactual values
dM_prime = dM; % vector of mfg. deficits relative to world GDP
d_prime = dM_prime; % vector of overall deficits relative to world GDP
T_hat = ones(N,1); % vector of productivities in counterfactual rel. to original
T_hat(20,1) = 1.2; % change in US technology

% CODE STARTS RUNNING HERE
% ----------------------------------------------------------------------
tic
% Main loop, looks for omega_hat that solves the system
[omega_hat_o,rho_hat_o,Pi_prime,omega_crit,omega_iter] = alg_wages(Pi,beta,theta,omega_tol,...
    rho_tol,max_iter,N,v,y,dM_prime,d_prime,T_hat,alpha);
% The change in real GDP is:
wr_change = (omega_hat_o./rho_hat_o).^(alpha);
Results4_p = [ rho_hat_o omega_hat_o./rho_hat_o wr_change];
%Results4_p(N,3) = (omega_hat_o(N)/rho_hat_o(N))^(alpha(N))*(1.2)^(1-alpha(N));
Results4 = [Results4_p(:,3)-1];
% Scaling with respect to the US
Results4 = Results4./(ones(N,1)*Results4(N,:))*100;


clear temp2 temp3 temp4 temp5 temp6 temp7 temp8
toc
% CODE STOPS HERE
% ----------------------------------------------------------------------



% Results
% ======================================================================

dlmwrite('Q3.txt', Results3);
dlmwrite('Q4_1.txt', Results4_p);
dlmwrite('Q4_2.txt', Results4);

figure(3)
subplot(2,1,1)
hold on
set(gca,'XScale','log')
scatter(Pi(1:N-1,N),log(Results4_p(1:N-1,3))*100)
xlabel('share of spending in US mfgs')
ylabel('% change in w^R relative to baseline')
subplot(2,1,2)
hold on
scatter(D(1:N-1)./Y(1:N-1),log(Results4_p(1:N-1,3))*100)
xlabel('Deficit/GDP')
ylabel('% change in w^R relative to baseline')
saveas(gcf,'figure3.eps')