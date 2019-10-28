% ========================================================== %
% Masterfile for Sotelo + Pellegrina
% Brian Cevallos Fujiy | Started on 6/17/2019
% ========================================================== %

%% Changing to local folder

tmp = matlab.desktop.editor.getActive;
cd(fileparts(tmp.Filename));

%% Housekeeping and planting seed

clc;
clear all;
close all;
rand('seed', 1010);

%% Primitives of the model

run('primitives.m');

%% Base algorithm

run('basealgorithm.m');

%% Checking Walras's Law

run('walras.m');

%% Simulating data, aggregates

run('simdata_aggreg.m');

%% Simulating data, samples

run('simdata_sample.m');
