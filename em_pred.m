function cluster_hat = em_pred(data, mu, Sigma, pi_k)

n = size(data,1);
k = size(pi_k,1);

final = zeros(n, k);
for i = 1:k
    final(:,i) = pi_k(i) * normal(data, mu(i,:), Sigma(:,:,i));
end
[M, cluster_hat] = max(final,[],2);