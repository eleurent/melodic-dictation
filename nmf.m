function H = nmf(V, W)
H = ones(size(W,2),size(V,2));

% Je passe à 100 itérations

for t=1:100 
    H = H.*(W'*(V./(W*H)))./repmat(sum(W)',1,size(H,2));
    D = kullback_divergence(V,W*H);
    disp(D);
end
end

function D = kullback_divergence(A, B)
D = sum(sum(A.*log10(A./B) - A + B));
end
