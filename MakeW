function W = makeW(x, fs, wlen, wstep, notes_count)
fourier = tfct(x, fs, wlen, wstep, 0);
note_duration = size(fourier,2)/(notes_count);
indices = floor(((0:notes_count-1)+1/4)*note_duration);
W = fourier(:,indices);
end
