function ends = find_note_endings(H_note, locs, ending_value_percentage_from_peak)
ends = zeros(size(locs));
for i = 1:length(locs)
    peak = H_note(locs(i));
    if (i<length(locs)-1)
        next_peak = locs(i+1);
    else
        next_peak = length(H_note)-1;
    end
    for ending=locs(i)+1:next_peak
        if H_note(ending) < peak*ending_value_percentage_from_peak
            break
        end
    end
    ends(i) = ending;
end
end
