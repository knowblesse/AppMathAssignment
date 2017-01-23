%% Assignment #4-1 : Gangnam
%   Applied Mathematics 2016
%   Jeong Ji Hoon
%   ST_ID : 2016010980
%% JEONG_JIHOON
%   @Knowblesse
%   Created on 2016-11-08
%   Last Modified on 2016-11-08
%% Initialization
clear; % close workspace
clear;
close all; % close all figures
clc; % close command window (output window of Matlab)
%% Data Points
month = [1,5,7,9,11,13,17,19,25,31];% July 2013 is Month 1. ex) Jan-2014 = 7
views = [1.6,1.8,1.85,1.9,1.95,2.1,2,2.15,2.35,2.45];% Billion Views
%% Plot Origianl Data
figure(1); % open or create figure
clf; % clear figure
scatter(month,views);
title('Gang Nam Style Movie Views in YouTube');
axis([0, 250, 0, 8]);
set(gca,'XTick',1:6:250);
%% Create Line Regression Plot
Cov_month_view = cov(month, views);
w =  Cov_month_view(1,2) / var(month);
b = mean(views) - w*mean(month);
X = 0 : 250;
Y = w.*X + b;
hold on;
plot(X,Y);
%% After 200 months from July 2013, 7 billion views is predicted.
%% March 2030 
scatter(200,w*200 + b);