%% Assignment #5-b : Gradient Descent - fitting the data
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

%% Data
X = 0:15;
Y = 2.5*X + 5 + 2*randn(1,16);

%% Constants for the Part b

% For the function f, 
%   SUM{ (Y_i - w*X_i - b )^2 } 
%   = SUM(X_i^2)*w^2 -2*SUM(X_i*Y_i)*w + 2*SUM(X_i)*w*b - 2*SUM(Y_i)*b + N*b^2 +SUM(Y_i^2) where N = number of datapoint
f = @(w,b) sum(X.^2).*w.^2 - 2*sum(X.*Y).*w + 2*sum(X).*w.*b - 2*sum(Y).*b + numel(X)*b.^2 + sum(Y.^2); % function for the part b
w0 = 0;
b0 = 0;
lambda = 0.0002;
tolerance = 1e-8;
maxiterations = 1000;

g1 = @(w,b) 2*sum(X.^2).*w - 2*sum(X.*Y) + 2*sum(X).*b; % partial derivative on w
g2 = @(w,b) 2*sum(X).*w - 2*sum(Y) + 2*numel(X).*b; % partial derivative on b

%% Gradient Descent
prevw = w0; % initial value of x1(i.e. x)
prevb = b0; % initial value of x2(i.e. y)
currw = [];
currb = [];
for i = 1 : maxiterations % iterate until maxiterations. If the squared norm of the gradient go below the tolerance this loop can be stopped early.
    prevw = [prevw, currw];
    prevb = [prevb, currb];
    currw = prevw(end) - lambda * g1(prevw(end), prevb(end));
    currb = prevb(end) - lambda * g2(prevw(end), prevb(end));
    if (g1(currw, currb)^2 + g2(currw, currb)^2) <= tolerance
        break; % stop when the squared norm is smaller than the tolerance
    end
end

%% Plot
figure(1);
clf;
subplot(1,2,1);
ezsurf(f,[0, 5, 0, 10]);
hold on;
plot3([prevw currw], [prevb currb], [f(prevw,prevb), f(currw,currb)], 'ro-');
title('Gradient Descent');

subplot(1,2,2);
scatter(X,Y);
hold on;
plot(X,currw*X + currb);


%% In the function, Weight value w has more power than the b value. 
%   As it shows in the graph, the optimization first finds the optimal weight and
%   than starts to adjust the b value to find the optimal point. 
%   In this particular function, I'm sure weight has more power.

%% In the optimization algorithm itself, lambda value seems to be really important.
%   In Question number a, wrong lambda value resulted non-convergeness
%   or took a lot of time to converge.
%   In this question, I was unalbe to get the optimal w and b at first time with the
%   lambda value I used in the previous question.
%   After adjusting the lambda value, the optimization converged.