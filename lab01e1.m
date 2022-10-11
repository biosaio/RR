% Riconoscimento e Recupero dell’Informazione per Bioinformatica
% Manuele Bicego
% 
% Lezione 1: Ripasso di Matlab
% Esercizi principali
%

clear all
close all
clc


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Esercizio 1 
% Definire i seguenti tre vettori: 
% - A vettore riga che contiene i numeri pari da 2 fino a 20, 
% - B vettore riga con tutti i numeri da -22 a -13, 
% - C vettore riga con 10 valori uguali a 0. 
% 
% A partire da questi, effettuare le seguenti operazioni
% - Creare una matrice MatX dove le righe sono costituite da A, B e C (in questo ordine) 
% - Verificare e salvare le dimensioni di MatX e il numero di elementi
% - Estrarre la sotto-matrice che contiene le prime due righe e le prime cinque colonne
% - Sostituire la seconda colonna di MatX con il valore 31
% - Creare una matrice MatY di numeri reali distribuiti in modo random (randn), con 4 righe e 10 colonne
% - Creare una matrice MatZ data dalla concatenazione di MatX e MatY
% - Verificare le dimensioni di MatZ ed estrarre la diagonale.
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%A = 2:2:20;

A = 2:2:20;
B = linspace(-22,-13,10);
C = zeros(1,10);

MatX = [A;B;C];
s = size(MatX);
n = numel(MatX);

subM = MatX(1:2,1:5);
MatX(:,2) = 31;

MatY = randn(4,10);

MatZ = [MatX; MatY];
sZ = size(MatZ);
nZ = numel(MatZ);
d = diag(MatZ);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Esercizio 2
% - Generare un numero casuale con il comando randn 
%   (distribuzione normale standard)
% - Assegnare alla variabile y il valore 1 se tale numero 
%   e' compreso tra -1 e 1 (media +- deviazione standard), 0 altrimenti.
% - Se ripeto il procedimento 10000 volte, quante volte il numero casuale 
%  cade nell'intervallo [-1 1]?
%
% EXTRA: Provare a risolvere l'esercizio anche senza usare cicli 
% (suggerimento: consultate l'help della funzione randn)

N = randn(1);
if (N <= 1) & (N >= -1)
    y = 1;
else
    y = 0;
end

yi = 0;
for i = 1:10000
    N = randn(1);
    if (N <= 1) & (N >= -1)
        yi = yi+1;
    end
end

%senza ciclo
Z = randn(1,10000);
Y = (Z <= 1) & (Z >= -1); 
sumY = sum(Y);

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Esercizio 3
% 1) Data l'immagine del cameraman, sostituire un "blocco" dell'immagine
% (ad esempio le prime 50 righe e le prime 50 colonne) con degli uni,
% e visualizzare l'immagine così ottenuta
% 2) Fare un figura con 2 subplot: un imagesc di una
% matrice random (usare rand), e il plot di una funzione 
% (es. coseno da -pi a pi)

D = imread('cells.png');
D(1:500,1:500) = ones(500,500);
%imshow(D);

E = rand(30,30);
figure(1);
subplot(1,2,1);
imagesc(E);

x = -pi:0.01:pi;
X = cos(x);
subplot(1,2,2);
plot(X);
