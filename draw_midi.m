function draw_midi(midi, axes, titre, indexes, color)
    Notes = midiInfo(midi,0);
    %% compute piano-roll:
    % Replace velocity values
    if nargin < 4
      indexes = [];
    end
    if nargin < 5
      color = 0.5;
    end
    Notes(:,4) = 1;
    Notes(indexes,4) = color;
    [PR,t,nn] = piano_roll(Notes, 1);

    %% display piano-roll:
    plot_image(t,nn,PR,axes,titre);
end