function mu = mu_t(data, phi, a_0, b_0, Sigma, d, k)

sum_n = data' * phi;

mu = zeros(k, d);
for j = 1:k
    x = (a_0(j) * inv(b_0(:,:,j)) * sum_n(:,j));
    mu(j,:) = Sigma(:,:,j) * x;
end
