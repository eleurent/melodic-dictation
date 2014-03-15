function W = makeW(x, fs, wlen, step, measure_position, notes_count)
W = zeros(fix(wlen/2), notes_count);
window = hanning(wlen);
for i = 0:notes_count-1
    deb = fix((i*step+measure_position)*fs);
    fin = deb + wlen - 1;
    x_win = x(deb:fin).*window;
    x_win_freq = fft(x_win, wlen);
    W(:,i+1) = x_win_freq(1:fix(wlen/2));
end

sW = sqrt(sum(W.^2,1));
W = W*diag(1./sW);
end
