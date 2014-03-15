% Lecture des pistes
[x] = wavread('sound/Chrom1.5.wav');
x = x(:,1);
[v,fs] = wavread('sound/Morceau.wav');
v = v(:,1);
% Paramètres
numero2note = 39;
wlen = 2^nextpow2(0.02*fs); % Fenetre de 20ms
wstep = wlen/4;

% Dictionnaire des notes
W = makeW(x, fs, wlen, 68.75/44, 10e-3, 45);

% Analyse du morceau
V = tfct(v, fs, wlen, wstep, 0);
H = nmf(abs(V), abs(W), 100, 1, fs, wstep, numero2note);

% Comparaison au morceau
drawMidi('sound/Morceau.mid')