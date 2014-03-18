function [f_m, R, P, fn, fp, vp] = f_mesure(morceau, H_midi, margin)
ref=readmidi(['sound/' morceau '.mid']);
ref_Notes=midiInfo(ref,0); 
H_Notes=midiInfo(H_midi,0);

fn=[];
vp=[];

for i = 1:size(ref_Notes,1)
    note = ref_Notes(i,3);
    start_time = ref_Notes(i,5);
    indices = find((H_Notes(:,5) > start_time - margin) & (H_Notes(:,5) < start_time + margin) & (H_Notes(:,3) == note));
    if isempty(indices)
        fn = [fn;i];
    else
        vp = [vp;[i indices(1)]];
        H_Notes(indices(1),5) = -inf;
    end
end

fp = find(H_Notes(:,5)>-inf);
R = size(vp,1)/(size(vp,1)+length(fn));
P = size(vp,1)/(size(vp,1)+length(fp));

f_m = 2*R*P/(R+P);
end
