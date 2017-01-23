%% Assignment #3-1 : Gaussian Elimination
%   Applied Mathematics 2016
%   Jeong Ji Hoon
%   ST_ID : 2016010980
%% JEONG_JIHOON
%   @Knowblesse
%   Created on 2016-10-20
%   Last Modified on 2016-10-20
%% Initialization
clear; % close workspace
clear;
close all; % close all figures
clc; % close command window (output window of Matlab)
%% Compare Gaussian Elimination Algorithm
n = [1,5,10,100,1000];
time = zeros(5,2); % first column = my code, second column = Matlab's code
for i = 1 : 5
    A = rand(n(i));
    b = rand(n(i),1);
    tic;GaussSolve(A,b);
    time(i,1) = toc;
    tic;A\b;
    time(i,2) = toc;
end
%% Plot Running time
plot(time);
legend 'My Algorithm' 'Matlab Algorithm'
title('Compare Speed of Algorithms');
%
% Question 3
% Matlab's function was 300 times faster on n = 1000 condition.
% I guess the computing time of my algorithm increases exponentially.
% Compared to other parts of my algorithm, the Forward Elimination part
% spent all the computing time.
% I propose the slowness of my algorithm is due to the frequent use of for
% loops(which I heard for loop in matlab function really slows down the
% performnace), and poor memory handling.



