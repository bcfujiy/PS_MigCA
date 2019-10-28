% ========================================================== %
% Masterfile for Sotelo + Pellegrina
% Brian Cevallos Fujiy | Started on 6/17/2019
% ========================================================== %

%% Changing to local folder

tmp = matlab.desktop.editor.getActive;
cd(fileparts(tmp.Filename));

%% Housekeeping and pla nting seed

clc;
clear all;
close all;
rand('seed', 1010);

%% Primitives of the model

run('primitives_mod1.m');

%% Base algorithm

run('basealgorithm.m');

%% Simulating data, aggregates

run('simdata_aggreg_mod1.m');
