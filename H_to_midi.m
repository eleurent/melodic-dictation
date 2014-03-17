function H_midi = H_to_midi(H, min_peak_height, fs, wstep, numero2note, write, path)
% Filtrage
Hf = filter(1,[1 -0.9],H,[],2);
% Dérivation
dH = filter([1 1 -1 -1]/2,1,Hf,[],2);
dH(dH<0)=0;
M = zeros(0, 4);
warning('off', 'signal:findpeaks:largeMinPeakHeight');
for note=1:size(H,1)
    % Attaques
    [pks,locs] = findpeaks(dH(note,:), 'MINPEAKHEIGHT', min_peak_height, 'MINPEAKDISTANCE', 25);
    % Fins de note
    ends = find_note_endings(Hf(note,:), locs, 0.8);
    % Supression des notes courtes
    short_notes = (ends-locs < 0.15*fs/wstep);
    locs(short_notes)=[];
    ends(short_notes)=[];
    % Ajout à M
    Mnote = [ones(size(locs)).*(note+numero2note); % note number
            ones(size(locs)).*60; % volume
            locs.*(wstep/fs); % note-on
            ends.*(wstep/fs)]'; % note-off
    M = [M; Mnote];
end
M = [ones(size(M,1),2) M]; % channel
H_midi = matrix2midi(M);
if write
    writemidi(H_midi, path);
end
end