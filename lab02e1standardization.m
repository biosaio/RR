% ------  Lezione2 ------ 
% Standardizzazione dei dati
% Esercizio 1 
%
% Caricare in memoria la matrice "iris.mat" (funzione load); 
% estrarre la sottomatrice contenente tutti gli oggetti e solo le prime due feature
% Visualizzare il dataset risultante (funzione scatter)
% Effettuare sul dataset la standardizzazione “z-score standardization” 
% (funzioni utili: mean, std)
% Controllare che la media lungo le due direzioni sia zero, 
% e che la deviazione standard sia 1
% Visualizzare il dataset dopo la standardizzazione (controllare gli assi!)
%


clear all; % cancella il contenuto di memoria
close all; % cancella tutte le figure presenti nella sessione
clc; % pulisce lo schermo

% Esercizio 1
% Caricare in memoria la matrice "iris.mat" (funzione load); 
% estrarre la sottomatrice contenente tutti gli oggetti e 
% solo le prime due feature
load("iris.mat");
X = data(1:2,:);

% Visualizzare il dataset risultante (funzione scatter)
figure(1);
subplot(1,2,1);
scatter(X(1,:),X(2,:),[],labels,'filled');
xlabel("Feature 1"); ylabel("Feature 2");
title("Dati originali");
axis('equal');

% Effettuare sul dataset la standardizzazione “z-score standazation” 
Xmeans = ones(2,150) .* mean(X,2);
Xstds = ones(2,150) .* std(X,[],2);

Xstand = (X - Xmeans) ./ Xstds;
Xstandmean = mean(Xstand,2);
Xstandstd = std(Xstand,[],2);

% Visualizzare il dataset dopo la standardizzazione (controllare gli assi!)
subplot(1,2,2);
scatter(Xstand(1,:),Xstand(2,:),[],labels,'filled');
xlabel("Feature 1"); ylabel("Feature 2");
title("Dati standardizzati");
axis('equal');


