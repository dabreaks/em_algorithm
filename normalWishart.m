function [m_j, c_j, a_j, B_j] = normalWishart(data_j, m, c, a, B)

[s, d] = size(data_j);

m_j = c / (s + c) * m + (1/(s+c)) * sum(data_j);

c_j = s + c;

a_j = a + s;

x_bar = mean(data_j);

x = bsxfun(@minus,data_j, x_bar);

B_j = B + x' * x + (s/(a * s + 1)) * (x_bar - m)' * (x_bar - m);