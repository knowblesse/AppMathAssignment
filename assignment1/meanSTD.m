function [ meanValue, stdValue ] = meanSTD( inputMatrix )
%Compute the mean and the std of each column
%   Input Parameters
%       input : target matrix
%   Output Parameters
%       meanValue : average value of each column of inputMatrix
%       stdValue : standard deviation(sample) value of each column of inputMatrix
meanValue = mean(inputMatrix); % calculate mean of each column
stdValue = std(inputMatrix); % calculate std of each column
return;
end

