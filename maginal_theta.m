function p_x = maginal_theta(data_i, m, c, a, B)

[n, d] = size(data_i);

one = (c/(pi * (1 + c)))^(d/2);

two = (det(B + (c/(c+1)) * (data_i - m)' *(data_i - m)) ^(-(a+1)/2)) / (det(B)^(-a/2));

stretch_d = (1:d)';
stretch_a = ones(d,1) * a;

three = exp(sum(log(gamma((stretch_a+1)/2 + (1-stretch_d)/2)) - log(gamma(stretch_a/2 + (1-stretch_d)/2))));

p_x = one * two * three;
