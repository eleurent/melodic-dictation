function drawMidi(filename)
    midi = readmidi(filename);
    Notes = midiInfo(midi,0);
    %% compute piano-roll:
    [PR,t,nn] = piano_roll(Notes);

    %% display piano-roll:
    figure;
    imagesc(t,nn((1:45)+3),PR((1:45)+3,:));
    axis xy;
    xlabel('time (sec)');
    ylabel('note number');

end