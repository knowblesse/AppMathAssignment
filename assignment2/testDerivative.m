%% Assignment #2-1 : Test Derivative
%   Applied Mathematics 2016
%   Jeong Ji Hoon
%   ST_ID : 2016010980
%% JEONG_JIHOON
%   @Knowblesse
%   Created on 2016-10-03
%   Last Modified on 2016-10-05
%% Initialization
clear; % close workspace
clear;
close all; % close all figures
clc; % close command window (output window of Matlab)
%% Get Derivatives of Sin function on -pi:0.1:+pi
x = -pi:0.1:pi; % Target X values
h = 0.1; % Constant
d = derive(@sin,x,h);
%% Compare derivative of Sin function
figure(1);
plot(x,d,'g');% plot d on green line
hold on;
plot(x,cos(-pi:0.1:pi),'r'); % plot cos on target x on red line
legend 'Approx f''(x)' 'Real f''(x)'
title('Compare derivative of Sin function');
%% Compare Error Values for each given "h"
% Initial Conditions
h = 1;
x = -pi:0.1:pi; % Target X values
f = cos(x); % real derivative function
hAccum = zeros(15,1); % array of all h values
err = zeros(15,1); % array of errors
% Loop
for step = 1 : 15; % total 15 steps
    d = derive(@sin,x,h);
    err(step,1) = ( sum( (d-f).^2 ) )^0.5;
    hAccum(step,1) = h;
    h = h / 2;
end
figure(2);
loglog(hAccum(:,1),err(:,1),'ro-');
grid
title('Compare different h values');
xlabel('h');
ylabel('Error');
% #### Q1 : "h" values which has Error lower than 10^-3
% #### A1 : 2^(-12), 2^(-13), 2^(-14)

%% Compare derivatives of other functions. 
% Constants
x = 0.1:0.1:10; % Target X values
h = 0.1; % Constant
% Functions
f1 = @(x) log(x);
f2 = @(x) x.^-0.5;
f3 = @(x) sin(x)./(x+5);
% Derivatives of Functions
df1 = 1./x;
df2 = (-0.5) .* x.^-1.5;
df3 = ((x+5) .* cos(x) - sin(x)) ./ (x+5).^2;
%% Compare derivative of log function
d = derive(f1,x,h);
figure(3);
plot(x,d,'g');% plot d on green line
hold on;
plot(x,df1,'r'); % plot cos on target x on red line
legend 'Approx f''(x)' 'Real f''(x)'
title('Compare derivative of f1 function');
%% Compare derivative of 1/x^0.5 function
d = derive(f2,x,h);
figure(4);
plot(x,d,'g');% plot d on green line
hold on;
plot(x,df2,'r'); % plot cos on target x on red line
legend 'Approx f''(x)' 'Real f''(x)'
title('Compare derivative of f2 function');
%% Compare derivative of sin(x)/(x+5) function
d = derive(f3,x,h);
figure(5);
plot(x,d,'g');% plot d on green line
hold on;
plot(x,df3,'r'); % plot cos on target x on red line
legend 'Approx f''(x)' 'Real f''(x)'
title('Compare derivative of f3 function');
