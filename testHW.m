% Notes
w = zeros(512,2);
w(:) = 0.0001;
w(50:60,1) = hanning(11);
w(100:110,1) = hanning(11)*0.9;
w(150:160,1) = hanning(11)*0.5;
w(200:210,1) = hanning(11)*0.3;
w(250:260,1) = hanning(11)*0.1;
w(200:250,2) = hanning(51);

% Time
h = zeros(2,1000);
h(:) = 0.0001;
h(1,1:10) = 1/10*(1:10);
h(1,10:240) = 1;
h(1,240:500) = 0.99.^(1:(300-40+1));
h(2,200:700) = hanning(700-200+1);

% Spectrogram
v = w*h;

% NMF
imagesc(h);
axis xy;
title('Original H');
figure;
imagesc(v);
title('Spectrogram');
axis xy;
h2 = nmf(v, w);
figure;
imagesc(h2);
title('Output H');
axis xy;