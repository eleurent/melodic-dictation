function H = nmf(V, W, n)
H = ones(size(W,2),size(V,2));
for t=1:n 
    H = H.*(W'*((V + eps)./(W*H + eps)))./repmat(sum(W)',1,size(H,2));
    D = kullback_divergence(V + eps, W*H + eps);
    fprintf('D = %e\n', D);
end
end

function D = kullback_divergence(A, B)
D = sum(sum(A.*log10(A./B) - A + B));
end
