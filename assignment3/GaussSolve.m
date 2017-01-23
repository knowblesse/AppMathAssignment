function [ x ] = GaussSolve( A,b )
% Solve linear system of equation Ax = b using Gaussian Elimination
% technique.
%   Input Parameters
%       A : A square array of 'a's
%       b : A column of 'b's
%   Output Parameters
%       x : solution column

%% Check whether the matrix A is Square or not
if size(A,1) ~= size(A,2)
    error('Input array A is not Square!');
end
%% Check whether the dimension of matrix A and b match with each other
if size(A,1) ~= size(b,1)
    error('Input array A and b size mismatch');
end

%% Forward Elimination
%
% Question b
% Since there are two for loops and total N!/{(N-2)!2!} iterations to do in Forward Elimination,
% this takes more time than Backward Substitution which has only one for
% loop and total N-1 iterations to do.
%
valA = A; % This code reserved A and b for Debugging purpose
valB = b;
for pivotRow = 1 : size(valA) % Select every rows in A as pivotRow
    % Partial Pivoting
    [~,maxIndex] = max(valA(pivotRow:end,pivotRow));% find the index of row which has maximum coefficient value
    maxIndex = maxIndex + pivotRow -1; % correct the index (the parameter used in upper "max" function has different starting index.)
    tempA = valA(pivotRow,:); % save current pivotRow's value to temp
    tempB = valB(pivotRow);
    valA(pivotRow,:) = valA(maxIndex,:); % switch current pivotRow's value with the row with maximum coefficient
    valB(pivotRow) = valB(maxIndex);
    valA(maxIndex,:) = tempA; % put the original pivotRow to the location where the row with maximum coefficient was
    valB(maxIndex) = tempB;
    if valA(pivotRow,pivotRow) == 0
        error('coefficient became 0!');
    end
    for row = pivotRow + 1 : size(valA) % to all rows below current pivotRow,
        f = valA(row,pivotRow)/valA(pivotRow,pivotRow); % get f
        valA(row,pivotRow:end) = valA(row,pivotRow:end) - valA(pivotRow,pivotRow:end).*f; % and change coefficient
        valB(row) = valB(row) - valB(pivotRow)*f;% b values also
    end
end

%% Backward Substitution
x = zeros(size(A,1),1); % column for solution
x(end) = valB(end) / valA(end); % first get the solution for the last X value
for index = size(A,1)-1 : -1 : 1 % for all the 'X'es above X(end),
    x(index) = ( valB(index) - sum(valA(index,:) .* x') ) / valA(index,index); % get the Solution
end

end

