% ------  Lezione2 ------ 
% Standardizzazione dei dati
% Esercizio 2 
%
% Implementare la z-score standardization senza utilizzare i cicli for
% Implementare le altre 4 standardizzazioni, controllando 
% sempre che il risultato corrisponda a quanto cercato 
% esempio: usando domain(3), per ogni direzione il minimo deve 
% essere zero e il massimo uno.
% Applicare le standardizzazioni al dataset originale (4x150)
%

clear all; % cancella il contenuto di memoria
close all; % cancella tutte le figure presenti nella sessione
clc; % pulisce lo schermo


% Implementare la z-score standardization senza utilizzare i cicli for. già
% fatto in esercizio 1

% Implementare le altre 4 standardizzazioni, controllando 
% sempre che il risultato corrisponda a quanto cercato 
load("iris.mat");
X = data(1:2,:);

figure(1);
subplot(3,2,1);
scatter(X(1,:),X(2,:),[],labels,'filled');
xlabel("Feature 1"); ylabel("Feature 2");
title("Dati originali");
axis('equal');

fprintf("matrice dati originali:\n");

for d = 1:2
    fprintf('Media direzione %d:        %f\n',d,mean(X(d,:)));
    fprintf('Dev standard direzione %d: %f\n',d,std(X(d,:)));
end


% Standardizzazione della deviazione standard:
Xstds = ones(2,150) .* std(X,[],2);
Xstand1 = X ./ Xstds;

fprintf("matrice Standardizzazione della deviazione standard:\n");

for d = 1:2
    fprintf('Media direzione %d:        %f\n',d,mean(Xstand1(d,:)));
    fprintf('Dev standard direzione %d: %f\n',d,std(Xstand1(d,:)));
end

subplot(3,2,2);
scatter(Xstand1(1,:),Xstand1(2,:),[],labels,'filled');
xlabel("Feature 1"); ylabel("Feature 2");
title("Standardizzazione della deviazione standard");
axis('equal');

% Standardizzazione domain 1:

M = ones(2,150) .* max(X,[],2);
Xstand2 = X ./ M;

fprintf("matrice Standardizzazione domain 1:\n");

for d = 1:2
    fprintf('Massimo direzione %d:        %f\n',d,max(Xstand2(d,:)));
end

subplot(3,2,3);
scatter(Xstand2(1,:),Xstand2(2,:),[],labels,'filled');
xlabel("Feature 1"); ylabel("Feature 2");
title("Standardizzazione domain 1");
axis('equal');

% Standardizzazione domain 2: 

R = ones(2,150) .* (max(X,[],2) - min(X,[],2));
Xstand3 = X ./ R;


subplot(3,2,4);
scatter(Xstand3(1,:),Xstand3(2,:),[],labels,'filled');
xlabel("Feature 1"); ylabel("Feature 2");
title("Standardizzazione domain 2");
axis('equal');

% Standardizzazione domain 3: 
m = ones(2,150) .* min(X,[],2);
R = ones(2,150) .* (max(X,[],2) - min(X,[],2));
Xstand4 = (X - m) ./ R;

subplot(3,2,5);
scatter(Xstand4(1,:),Xstand4(2,:),[],labels,'filled');
xlabel("Feature 1"); ylabel("Feature 2");
title("Standardizzazione domain 3");
axis('equal');



