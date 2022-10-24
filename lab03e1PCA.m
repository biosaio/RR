% ------  Lezione3 ------ 
% PCA
% esercizio 1
% Caricare il dataset iris.mat
% Calcolare la matrice di trasformazione A utilizzando 
% la Principal Component Analysis
% Ridurre la dimensionalita' del dataset a 2 
% e visualizzarlo (visualizzare le varie classi con colori diversi)
%

clear all; % cancella il contenuto di memoria
close all; % cancella tutte le figure presenti nella sessione
clc; % pulisce lo schermo

% Caricare il file "iris.mat":
% dataset di 150 oggetti in uno spazio 4-dimensionale.
load iris.mat

% Capisco quante feature e quanti oggetti ho nel dataset
[D,N] = size(data);
X = data;

% ho 4 features, ogniuna con i dati di 150 osservazioni 
% Calcolare la matrice di trasformazione A utilizzando 
% la Principal Component Analysis

% Si calcola la media e si centrano i dati

u = mean(X, 2);
h = ones(1,N);
B = data - u*h;

% si calcola la matrice di covarianza, nel caso di 4 features, sarà 4x4 

C = 1/(N-1) * (B * (B.'));

% si calcolano autovettori e autovalori della matrice di covarianza 

[V, D] = eig(C);

% V è una matrice con gli autovettori, mentre D contiene gli autovalori di
% V nella diagonale. estraggo gli autovalori 

[lambda, ind] = sort(diag(D), 'descend');
A = V(:,[ind(1,1) ind(2,1)]);

% calcolo la matrice Y finale 

Y = A.' * X;

figure(1);
scatter(Y(1,:), Y(2,:), [], labels, 'fill');
title('data after PCA')
