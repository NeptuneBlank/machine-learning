function [C, sigma] = dataset3Params(X, y, Xval, yval)
%DATASET3PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = DATASET3PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
% Set up a vector with the logrithically-separated
% values indicated in the assignment PDF
val = [0.01, 0.03, 0.1, 0.3, 1, 3, 10, 30];
err = zeros(length(val));

for i = 1:length(val)
    C_val = val(i);
    for j = 1:length(val)
         sigma_val = val(j);
         % For each cell in the i x j matrix, err
         % train the SVM using each combination of C and sigma
         model = svmTrain(X, y, C_val, @(x1, x2) gaussianKernel(x1, x2, sigma_val));
         % Determine how well it separates the values
         predictions = svmPredict(model, Xval);
         % Store that metric in the err matrix
         err(i, j) = mean(double(predictions ~= yval));
    end
end

% Identify the cell with minimum error
minErr = min(min(err));

% Extract the C and sigma values from the determined cell
[c_ind, sig_ind] = find(err == minErr);

% Assign the value of the given indexes of C and sigma
C = val(c_ind); sigma = val(sig_ind);




% =========================================================================

end
