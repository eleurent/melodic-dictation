function H = nmf(V, W, n, display)
H = ones(size(W,2),size(V,2));
epsilon = ones(size(V))*0.00000001;
for t=1:n 
    H = H.*(W'*(V./(W*H + epsilon)))./repmat(sum(W)',1,size(H,2));
    if display
        D = kullback_divergence(V + epsilon, W*H + epsilon);
        disp(D);
    end
end
if display
    imagesc(H);
    axis xy;
    title('H calculé');
end
end

function D = kullback_divergence(A, B)
D = sum(sum(A.*log10(A./B) - A + B));
end
