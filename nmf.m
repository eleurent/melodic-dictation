function H = nmf(V, W, n, display, fs, wstep, numero2note)
H = ones(size(W,2),size(V,2));
for t=1:n 
    H = H.*(W'*((V + eps)./(W*H + eps)))./repmat(sum(W)',1,size(H,2));
    if display
        D = kullback_divergence(V + eps, W*H + eps);
        disp(D);
    end
end
if display
    figure;
    imagesc((1:size(H,2))*wstep/fs, (1:size(H,1))+numero2note, H);
    axis xy;
    title('H calculé');
end
end

function D = kullback_divergence(A, B)
D = sum(sum(A.*log10(A./B) - A + B));
end
