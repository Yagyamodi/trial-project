function [U, S] = pca(X)
%PCA Run principal component analysis on the dataset X
%   [U, S, X] = pca(X) computes eigenvectors of the covariance matrix of X
%   Returns the eigenvectors U, the eigenvalues (on diagonal) in S
%

% Useful values
[m, n] = size(X);

% You need to return the following variables correctly.
U = zeros(n);
S = zeros(n);

% ====================== YOUR CODE HERE ======================
% Instructions: You should first compute the covariance matrix. Then, you
%               should use the "svd" function to compute the eigenvectors
%               and eigenvalues of the covariance matrix. 
%
% Note: When computing the covariance matrix, remember to divide by m (the
%       number of examples).
%

% 1. Mean normalisation

    %% 1.1 Find Mean
feature_mean = zeros(n,1);

for i = 1:m,
    feature_mean(:,1) = feature_mean(:,1) + X(i,:)';
end;

for j = 1:n,
    feature_mean(j) = feature_mean(j) / m;
end;

    %% 1.2 Normalise mean
for i = 1:m,
    X(i,:) = X(i,:) - feature_mean(:)';
end;

% 2. Feature Scaling

    % 2.1 Find max and min of every feature

for j=1:n,
    max_sj = max(X(:,j));
    min_sj = min(X(:,j));

    sj = max_sj - min_sj;

    X(:,j) = X(:,j) / sj;
end;

% 3. Find sigma - covariance matrix

sigma = zeros(n,n);

for i = 1:m,
    sigma = sigma + X(i,:)' * X(i,:);
end;
sigma = sigma / m;

% 4. Find [U, S, V]

[U, S, V] = svd(sigma);




% =========================================================================

end
