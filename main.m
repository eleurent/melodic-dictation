%Lecture des pistes
[v,fs] = wavread('Morceau.wav');
v = v(:,1);

[x] = wavread('Chrom1.5.wav');
x = x(:,1);

%Création de W
wlen = 0.05*fs; % Fenetre de 50ms
W = makeW(x, fs, wlen, wlen/4,45); % A ne faire que la première fois of course

%imagesc(db(abs(W)));
%axis xy;
%title('W chromatique');

%Calcul de V puis H
V = tfct(v,fs,wlen,wlen/4,0);

V(V==0)=0.00001;
W(W==0)=0.00001;

H = nmf(abs(V),abs(W));

imagesc(H);
axis xy;
title('H calculé');
