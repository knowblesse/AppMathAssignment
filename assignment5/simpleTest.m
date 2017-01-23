%% Assignment #5-a : Gradient Descent - simpleTest
%   Applied Mathematics 2016
%   Jeong Ji Hoon
%   ST_ID : 2016010980
%% JEONG_JIHOON
%   @Knowblesse
%   Created on 2016-11-16
%   Last Modified on 2016-11-16
%   Tested on Matlab 2015a
%% Initialization
clear; % close workspace
clear;
close all; % close all figures
clc; % close command window (output window of Matlab)

%% Constants for the Part a
f = @(x1,x2) x1.^2 + x1.*sin(x2) + 3*x2.^2; % function for the part a
xstart = [15, 15]';
lambda = 0.08;
tolerance = 1e-8;
maxiterations = 1000;

g1 = @(x1,x2) 2*x1 + sin(x2); % partial derivative on x1
g2 = @(x1,x2) x1.*cos(x2) + 6*x2; % partial derivative on x2

%% Call the Gradient Descent Function
[ xoptimal, foptimal, niterations ] = gradient_descent(f, g1, g2, xstart, lambda, tolerance, maxiterations);

%% Finding the Lambda Value which result non-convergeness
%       Lambda of 0.32 result non-convergeness.
%       And also other Lambda values over 0.32 will result
%       non-convergeness too.
%       Below is the script I used.
% lambda = 0.1;
% accum_niterations = [];
% accum_Lambda = [];
% while niterations ~= maxiterations; 
%     [ xoptimal, foptimal, niterations ] = gradient_descent(f, g1, g2, xstart, lambda, tolerance, maxiterations);
%     accum_niterations = [accum_niterations, niterations];
%     accum_Lambda = [accum_Lambda, lambda];
%     lambda = lambda + 0.01;
% end
% figure(2);
% plot(accum_Lambda, accum_niterations);
% TargetLambda = lambda - 0.01;


%% Finding the Lambda Value which has the minimum number of steps in order to reach the minimum point
%       Lambda of 0.244 ~ 0.248 have the minimum number of steps(21) in order to reach the minimum point.
%       Below is the script I used.

% lambda = 0.2;
% accum_niterations = [];
% accum_Lambda = [];
% while lambda <= 0.3; % start from 0.2 until 0.3. This value was seleted because minimum point of niterations was near 0.25 when I tried all lambda values(step size 0.05) from 0 to the point where optimization does not converge. 
%     [ xoptimal, foptimal, niterations ] = gradient_descent(f, g1, g2, xstart, lambda, tolerance, maxiterations);
%     accum_niterations = [accum_niterations, niterations];
%     accum_Lambda = [accum_Lambda, lambda];
%     lambda = lambda + 0.001;
% end
% figure(3);
% plot(accum_Lambda, accum_niterations);
% TargetLambda = accum_Lambda(find(accum_niterations == min(accum_niterations)));
