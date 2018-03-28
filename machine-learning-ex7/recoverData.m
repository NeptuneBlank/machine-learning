function X_rec = recoverData(Z, U, K)
%RECOVERDATA Recovers an approximation of the original data when using the 
%projected data
%   X_rec = RECOVERDATA(Z, U, K) recovers an approximation the 
%   original data that has been reduced to K dimensions. It returns the
%   approximate reconstruction in X_rec.
%

% You need to return the following variables correctly.(R mxn)
X_rec = zeros(size(Z, 1), size(U, 1));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the approximation of the data by projecting back
%               onto the original space using the top K eigenvectors in U.
%
%               For the i-th example Z(i,:), the (approximate)
%               recovered data for dimension j is given as follows:
%                    v = Z(i, :)';
%                    recovered_j = v' * U(j, 1:K)';
%
%               Notice that U(j, 1:K) is a row vector.
%   assign value to i-th row & j-th column of X_rec
for i = 1:size(Z,1)
    for j = 1:size(U,1)
        %I tested, in this case, "double negative" does not matter
        v = Z(i,:)';
        %so called recovered_j is a scalar
        X_rec(i,j) = v' * U(j,1:K)';
    end
end



% NOTE: Recommended assignment of v involves transposing Z(i) to a column
%       vector, simply to transpose it back to a row, so the process has 
%       been optimized by removing this "double negative" operation.

% =============================================================

end
