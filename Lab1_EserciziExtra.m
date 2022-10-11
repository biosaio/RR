% Riconoscimento e Recupero dell’Informazione per Bioinformatica
% Manuele Bicego
% 
% Lezione 1: Ripasso di Matlab
% Esercizi extra

clear all
close all
clc

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Esercizio 4 
% Data l'immagine I (è una matrice) di cellule U2OS (Human Bone Osteosarcoma), 
%   provare ad evidenziare i nuclei. 
% Idea: a partire da I, cercare solo i valori sopra una certa soglia.
% Provare prima con una soglia di 30, quindi con una soglia di 70.
% Costruire inoltre un subplot dove l'immagine originale viene affiancata 
%   all'immagine in cui sono evidenziati i nuclei.


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Soluzione Esercizio 4.
I = imread('cells.png');  

figure(1);
subplot(1,3,1);
imshow(I);

I30 = I > 29;
subplot(1,3,2);
imshow(I30);

I70 = I > 69;
subplot(1,3,3);
imshow(I70);



%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Esercizio 5
% - Inizializzare due vettori v1 e v2 con i valori [0 0] e [1 1] rispettivamente.
% - Assumendo che i due numeri contenuti nel vettore siano coordinate (x,y) 
%   in un piano cartesiano, calcolare la distanza euclidea tra v1 e v2 (Comandi utili: sum, sqrt)
% - Ripetere l'esercizio inizializzando v1 con [2; 0] e v2 con [0; 2]. 
%
% - Domanda. E' importante che i vettori siano definiti in riga o in colonna?

v1 = [0 0];
v2 = [1 1];
dist = sqrt((v2(1,2) - v1(1,2))^2 + (v2(1,1) - v1(1,1))^2);

v1 = [2; 0];
v2 = [0; 2];

dist2 = sqrt((v2(2,1) - v1(2,1))^2 + (v2(1,1) - v1(1,1))^2);


%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Esercizio 6
% - Creare una function chiamata Mymean che dato un vettore o 
%   una matrice in ingresso restituisca il valore medio. 
% - In particolare, nel caso di vettori la function restituisce un singolo valore medio, 
%   mentre per le matrici un vettore riga contenente il valor medio di ogni colonna. 
% - Controllare che la funzione dia il risultato atteso (confronto con il risultato della funzione mean di matlab) 
%   con in ingresso un vettore riga, un vettore colonna e una matrice


