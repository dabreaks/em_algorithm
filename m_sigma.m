function sig = m_sigma(data, mu, gam, N_k);

[n, d] = size(data);
k = size(N_k,1);

sig = zeros(d,d,k);
for j = 1:k
    x = bsxfun(@minus,data, mu(j,:));
    for i = 1:n
        sig(:,:,j) = sig(:,:,j) + gam(i,j) * (x(i,:)' * x(i,:));
    end
    sig(:,:,j) = sig(:,:,j) / N_k(j);
end