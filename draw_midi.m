function draw_midi(midi, axes, titre)
    Notes = midiInfo(midi,0);
    %% compute piano-roll:
    [PR,t,nn] = piano_roll(Notes);

    %% display piano-roll:
    plot_image(t,nn,PR,axes,titre);
end