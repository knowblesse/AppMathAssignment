%% Assignment #1-2 : Statiscal Analysis of HR, Weight, and Exercise
%   Applied Mathematics 2016
%   Jeong Ji Hoon
%   ST_ID : 2016010980
%% JEONG_JIHOON
%   @Knowblesse
%   Created on 2016-09-20
%   Last Modified on 2016-09-21
%% Initialization
clear; % close workspace
clear;
close all; % close all figures
clc; % close command window (output window of Matlab)
%% Load data
load('experimentData.mat');
%% Label of Data
l_Title = {'Heart rate', 'Weight', 'Exercise'};
l_Unit = {'Heart rate(bpm)', 'Weight(kg)', 'Exercise(hrs)'};
%% Use Function "meanSTD.m"
[data1, data2] = meanSTD(experimentData);
figure(1); % make a figure 1
for i = 1 : 3 % make 3 subplots
    subplot(1,3,i); % subplot with 1 row and 3 colums
    hold on;
    plot(experimentData(:,i)); % plot original data
    plot([1, numel(experimentData(:,i))],[data1(i), data1(i)],'b'); % plot mean line in blue
    plot([1, numel(experimentData(:,i))],[(data1(i)-data2(i)), (data1(i)-data2(i))],'--b'); % plot mean - std line in blue dashed line
    plot([1, numel(experimentData(:,i))],[(data1(i)+data2(i)), (data1(i)+data2(i))],'--b'); % plot mean + std line in blue dashed line
    title(l_Title{i});
    xlabel('Participant Number');
    ylabel(l_Unit{i});
end
%% Save Figure 1
saveas(gcf,'analysis.fig');
%% Create Second Plot
figure(2); % make a figure 2
subplot(1,3,1);
scatter(experimentData(:,1),experimentData(:,2)); % HR by Weight
title('HR against Weight');
xlabel('Heart Rate(bpm)');
ylabel('Weight(kg)');
subplot(1,3,2);
scatter(experimentData(:,1),experimentData(:,3)); % HR by Exercise rate
title('HR against Exercise rate');
xlabel('Heart Rate(bpm)');
ylabel('Exercise rate(hrs)');
subplot(1,3,3);
scatter(experimentData(:,2),experimentData(:,3)); % Weight by exercise rate
title('Weight against Exercise rate');
xlabel('Weight(kg)');
ylabel('Exercise rate(hrs)');
%% Save Figure 2
saveas(gcf,'analysis2.fig');
%% Observations
%   Line graph for the first figure seems bit odd.
%   I think rather bar graph with ascending y value's order or a scatter
%   graph is much more reasonable
%   HR against Weight has a positive relationship
%   HR against Exercise rate has a negative relationship
%   However Weight against Exercise rate doen't seem to have a relationship
%   at all.
%   Of course we can not find out a causual relationship with this data,
%   but I guess there is something with HR - Weight and HR -  Exercise
%   rate.

