function result = tfct(x, fs, wlen, wstep, display)
x=x(:);
window = hanning(wlen);
wlen = fix(wlen); wstep = fix(wstep);
result = zeros(fix(wlen/2),fix((length(x)-wlen)/wstep));
n_iter = fix((length(x)-wlen)/wstep);
for i = 1:n_iter;
    deb = 1 + (i-1)*wstep;
    fin = deb + wlen - 1;
    x_win = x(deb:fin).*window;
    x_win_freq = fft(x_win, wlen);
    result(:,i) = x_win_freq(1:fix(wlen/2));
end
if display
    t = (0:n_iter-1) * wstep / fs;
    f = (0:wlen/2-1) * (fs/wlen);
    imagesc(t,f,db(abs(result)));
    axis xy
end
end