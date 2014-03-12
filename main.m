% Lecture des pistes
[v,fs] = wavread('sound/Morceau.wav');
v = v(:,1);
[x] = wavread('sound/Chrom1.5.wav');
x = x(:,1);

% Paramètres
wlen = 0.05*fs; % Fenetre de 50ms

% Dictionnaire des notes
W = makeW(x, fs, wlen, wlen/4, 0, 45);

% Analyse du morceau
V = tfct(v, fs, wlen, wlen/4, 0);
H = nmf(abs(V), abs(W), 100, 1);