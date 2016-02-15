function f_x = normal(data, mu, sigma)
n = size(data,1);
k = size(mu,1);

const = 1/sqrt((2* pi)^k * det(sigma));
x = bsxfun(@minus,data,mu);
y = zeros(n,1);
for i = 1:n
    y(i) = x(i,:) * inv(sigma) * x(i,:)';
end
f_x = const * exp(-0.5*y);
