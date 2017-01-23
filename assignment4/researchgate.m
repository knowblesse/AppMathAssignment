%% Assignment #4-3 : Researchgate
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
year = [2009, 2010, 2011, 2011.684,2012,2012.789,2013,2014,2015,2015.211];
members = [0.0584, 0.2482, 0.6131, 1, 1.29, 2, 2.2773, 3.8321, 6.1533, 7];

%% Plot Data Points
figure(1);
clf;
scatter(year,members);
hold on;
xlabel('Years');
ylabel('Members');
title('Research Gate');

%% Variables
maxDegree = 7;
C = cell(1,maxDegree); % coefficients
R = zeros(1,maxDegree); % norm of the residuals

%% Calculate Fits (Line)
X = year;
Y = members;
for degree = 1 : maxDegree
    A = fliplr(vander(X)); % Create Vandermonde Matrix
    A = A(:,1:degree+1); % Cut the Vandermonde Matrix to given degree size
    b = Y';
    for col1 = 1 : degree+1 % for every columns repeat this
        alpha = norm(A(col1:end,col1)); % L2 norm of the selected column of A
        v_alpha = zeros(numel(X),1);
        v_alpha(col1,1) = -alpha * sign(A(col1,col1)); % Sign function was used to avoid cancellation
        v = A(:,col1) - v_alpha; % target vector used in Householder transformation
            if col1 ~= 1 % change the upper values to zero everytime except for the first column  
                v(1:col1-1,1) = 0;
            end
            for column2 = col1 : degree+1% for every columns below selected column, repeat this
                a = A(:,column2);
                A(:,column2) = a - (2 * v' * a) / norm(v)^2 * v; % Apply Householder transformation
            end
        b = b - (2 * v' * b) / norm(v)^2 * v; % do it to b too.
    end
    C{degree + 1} = A(1:degree+1,:)\b(1:degree+1,1); % coefficient of the polynormal graph. (starting from c_0)
    warning('off','all')
    Yfit = [];
    for i = 1 : numel(X)
        x = X(i);
        eval(['Yfit(i) = ', char(poly2sym(fliplr(C{degree + 1}'))),';']);
    end
    R(degree) = norm(Yfit - Y);
end

%% Calculate Fits (exponential)
X = year;
Y = log(members);
for degree = 1 
    A = fliplr(vander(X)); % Create Vandermonde Matrix
    A = A(:,1:degree+1); % Cut the Vandermonde Matrix to given degree size
    b = Y';
    for col1 = 1 : degree+1 % for every columns repeat this
        alpha = norm(A(col1:end,col1)); % L2 norm of the selected column of A
        v_alpha = zeros(numel(X),1);
        v_alpha(col1,1) = -alpha * sign(A(col1,col1)); % Sign function was used to avoid cancellation
        v = A(:,col1) - v_alpha; % target vector used in Householder transformation
            if col1 ~= 1 % change the upper values to zero everytime except for the first column  
                v(1:col1-1,1) = 0;
            end
            for column2 = col1 : degree+1% for every columns below selected column, repeat this
                a = A(:,column2);
                A(:,column2) = a - (2 * v' * a) / norm(v)^2 * v; % Apply Householder transformation
            end
        b = b - (2 * v' * b) / norm(v)^2 * v; % do it to b too.
    end
    C{8} = A(1:degree+1,:)\b(1:degree+1,1); % coefficient of the polynormal graph. (starting from c_0)
    Yfitexp = [];
    for i = 1 : numel(X)
        x = X(i);
        eval(['Yfitexp(i) = ', char(poly2sym(fliplr(C{8}'))),';']);
    end
    R(8) = norm(Yfitexp - Y);
end

%% Lowest norm of residuals
[~, index] = min(R)
plot(year,exp(Yfitexp));
%% Observation
% A fit which has a smallest norm of residuals is polinominal degree 4.
% However there is a high chance that this graph only fits to given dataset.
% Since the Best fit need to have not only lower norm of residuals but also generalizability ,
% Best Fit model is the exponential model