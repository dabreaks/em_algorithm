clear 

load('data.txt');

% parameters
[n, d] = size(data);

% k_list = [2, 4, 8, 10];
k_list = [2, 4, 8, 10];

like = NaN(101,size(k_list,2));
labels = zeros(n, size(k_list,2));
dim = 1;

for k = k_list
    % initialize mu_k, Sigma_k, pi_k
    
    [mu, Sigma, pi_k] = init_em(d, k);
    
    m = 1;
    like(m, dim) = loglikelihood(data, mu, Sigma, pi_k);
    for m = 2:101
  
        gam = responsibility(data, mu, Sigma, pi_k);
        
        % eval params with new responsibilities
        N_k = sum(gam)';

        mu = bsxfun(@rdivide, (gam' * data), N_k);
        
        % Sigma
        Sigma = m_sigma(data, mu, gam, N_k);

        % pi
        pi_k = N_k / n;
        
        % eval log likelihood
        
        like(m, dim) = loglikelihood(data, mu, Sigma, pi_k);

    end
    labels(:,dim) = em_pred(data, mu, Sigma, pi_k);
    dim = dim + 1;    

end
figure;
plot(like);
title('Likelihood against iterations');
xlabel('iterations');
ylabel('likelihood');
legend('2', '4', '8', '10');
legend('Location','southeast');
print('q1partb', '-dpng');

for i = 1:size(k_list,2)
    k = num2str(k_list(i));
    figure;
    gscatter(data(:,1), data(:,2),labels(:,i));
    t = strcat('cluster plot of data (k=',k, ')');
    title(t);
    xlabel('x1');
    ylabel('x2');
    legend('Location','southeast');
    s = strcat('q1partc',k);
    print(s, '-dpng');

end



