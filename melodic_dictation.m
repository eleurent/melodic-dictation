function [] = melodic_dictation(input_file)

%% Lecture des pistes
[x] = wavread('sound/Chrom1.5.wav');
[v,fs] = wavread(['sound/' input_file '.wav']);
ref_midi = readmidi(['sound/' input_file '.mid']);
x = x(:,1);
v = v(:,1);

%% Paramètres
nombre_notes = 45;
numero2note = 39;
wlen = 2^nextpow2(0.02*fs); % Fenetre de 20ms
wstep = wlen/4;
axes = [0 (length(v) - wlen)/fs 0+numero2note nombre_notes+numero2note];

%% Dictionnaire des notes
W = makeW(x, fs, wlen, 68.75/44, 10e-3, nombre_notes);

%% Analyse du morceau
V = tfct(v, fs, wlen, wstep, 0);
H = nmf(abs(V), abs(W), 100);

%% Filtrage et conversion en midi
%H_midi = H_to_midi(H, 20, fs, wstep, numero2note, 1, ['sound/' morceau '_out.mid']);
[H_midi, min_peak_height] = automatic_H_to_midi(H, ref_midi, fs, wstep, numero2note, 1, ['sound/' input_file '_out.mid']);

%% Calcul de precision/rappel
[f_m, R, P, fn, fp, vp] = f_mesure(ref_midi, H_midi, 0.05);
fprintf('Meilleur filtrage pour min_peak_height = %d \nf_m = %f\n', [min_peak_height f_m]);

%% Affichage de la partition
draw_midi(ref_midi, axes, 'H référence', fn, 0.8);

%% Affichage du morceau
plot_image((1:size(H,2))*wstep/fs, (1:size(H,1))+numero2note, H, axes, 'H calculé');

%% Affichage du morceau filtré
draw_midi(H_midi, axes, 'H filtré', fp, 0.2);