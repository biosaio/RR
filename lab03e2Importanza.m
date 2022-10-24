% ------  Lezione3 ------ 
% PCA
% esercizio 2
%
% Caricare il dataset brain_cancer_expression.mat
% Contiene l’espressione genica di 100 geni per 90 pazienti malati di 
% 5 tipologie diverse di cancro
% Pomeroy et al., Prediction of central nervous system embryonal tumour 
% outcome based on gene expression, Nature: 415, pages436–442 (2002)
% Calcolare il numero di direzioni sufficienti a spiegare 
% il 95% e il 99% della varianza
%


clear all; % cancella il contenuto di memoria
close all; % cancella tutte le figure presenti nella sessione
clc; % pulisce lo schermo

% Caricare il file "brain_cancer_expression.mat":
% dataset di 90 oggetti in uno spazio 100-dimensionale.
load brain_cancer_expression.mat


% Capisco quante feature e quanti oggetti ho nel dataset
[d,N] = size(data);
X = data;

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

%Calcolare il numero di direzioni sufficienti a spiegare il 95% e il 99% della varianza

lambdaTOT = sum(lambda);
lambdaRel = lambda / lambdaTOT;

i = 0; imp = 0;
while imp < 0.95
    i=i+1;
    imp = imp + lambdaRel(i);
end

d95 = i;

i = 0; imp = 0;
while imp < 0.99
    i=i+1;
    imp = imp + lambdaRel(i);
end

d99 = i;


