function likelihood = loglikelihood(data, mu, Sigma, pi_k)
n = size(data,1);
k = size(pi_k,1);
piece = zeros(n,k);
for i = 1:k
    piece(:,i) = pi_k(i) * normal(data, mu(i,:), Sigma(:,:,i));
end

likelihood = sum(log(sum(piece,2)));
