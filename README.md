melodic-dictation
=================

This project is a matlab script for automated melodic dictation.

# How it works

First, the spectrogram of the music track is extracted using a [Short-Term Fourier Transform](https://github.com/eleurent/melodic-dictation/raw/master/doc/Sap-Modification-Transp.pdf) (STFT, or TFCT).

![STFT](https://github.com/eleurent/melodic-dictation/raw/master/images/tfct.png "STFT")

Then, the idea is to break down the spectrogram matrix V as a product of two matrices: V = W*H
Where:
- W is a preconstituted matrix containing the spectrograms of all the notes in the chromatic scale
- H is a matrix describing which notes are played at all times - a.k.a the music score.

![chromatic scale](https://github.com/eleurent/melodic-dictation/raw/master/images/W.png "W - Chromatic scale")

So while we can easily generate W, the goal is to find H using the [Non-negative Matrix Factorization](https://github.com/eleurent/melodic-dictation/raw/master/doc/seung-nonneg-matrix.pdf) (NMF) method. An algorithm using the Kullback-Leibler divergence is described in a paper by [Lee and Seung](https://github.com/eleurent/melodic-dictation/raw/master/doc/2000_leeandseung.pdf).

Applied to the previous spectrogram, we get the following H matrix:

![Calculated H](https://github.com/eleurent/melodic-dictation/raw/master/images/tetris-calc.png "Calculated H")

Some signal processing will help to determine the start and end of each note:

![Filtered H](https://github.com/eleurent/melodic-dictation/raw/master/images/tetris-filt.png "Filtered H")

And we can finally export the result to a music score or a MIDI file

![Music score](https://github.com/eleurent/melodic-dictation/raw/master/images/tetris-score.png "Music score")

# A few examples

Original | Reconstruction
------------ | -------------
[tetris.mid](https://github.com/eleurent/melodic-dictation/raw/master/sound/tetris.mid) | [tetris_out.mid](https://github.com/eleurent/melodic-dictation/raw/master/sound/tetris_out.mid)
[zelda.mid](https://github.com/eleurent/melodic-dictation/raw/master/sound/zelda.mid) | [zelda_out.mid](https://github.com/eleurent/melodic-dictation/raw/master/sound/zelda_out.mid)
[mario.mid](https://github.com/eleurent/melodic-dictation/raw/master/sound/mario.mid) | [mario_out.mid](https://github.com/eleurent/melodic-dictation/raw/master/sound/mario_out.mid)