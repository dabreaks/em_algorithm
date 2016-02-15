function [mu, Sigma, pi_k] = init_em(d, k)

mu = rand(k, d);
Sigma = rand(d,d,k);
for i = 1:k
    Sigma(:,:,i) = Sigma(:,:,i) + Sigma(:,:,i)' + d * eye(d);
end
pi_k = ones(k, 1);

pi_k = pi_k * 1/k;


