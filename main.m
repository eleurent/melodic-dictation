% Lecture des pistes
[x] = wavread('sound/Chrom1.5.wav');
x = x(:,1);
[v,fs] = wavread('sound/Morceau.wav');
v = v(:,1);
% Paramètres
nombre_notes = 45;
numero2note = 39;
wlen = 2^nextpow2(0.02*fs); % Fenetre de 20ms
wstep = wlen/4;
axes = [0 (length(v) - wlen)/fs 0+numero2note nombre_notes+numero2note];

% Dictionnaire des notes
W = makeW(x, fs, wlen, 68.75/44, 10e-3, nombre_notes);

% Affichage du morceau
draw_midi(readmidi('sound/Morceau.mid'), axes, 'H référence');

% Analyse du morceau
V = tfct(v, fs, wlen, wstep, 0);
H = nmf(abs(V), abs(W), 100);
plot_image((1:size(H,2))*wstep/fs, (1:size(H,1))+numero2note, H, axes, 'H calculé');

% Filtrage et conversion en midi
H_midi = H_to_midi(H, fs, wstep, numero2note, 1, 'sound/out.mid');
draw_midi(H_midi, axes, 'H filtré');