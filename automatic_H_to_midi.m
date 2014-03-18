function [H_midi, optimal_min_peak_height] = automatic_H_to_midi(H, ref_midi, fs, wstep, numero2note, write, path)
min_peak_height_range = 1:1:30;
evaluation = @(x) f_mesure(ref_midi, H_to_midi(H, x, fs, wstep, numero2note, 0, ''), 0.05);
evaluation_values = arrayfun(evaluation, min_peak_height_range);
[best, best_idx] = max(evaluation_values);
optimal_min_peak_height = min_peak_height_range(best_idx);
H_midi = H_to_midi(H, optimal_min_peak_height, fs, wstep, numero2note, write, path);
end