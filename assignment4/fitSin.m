%% Assignment #4-2 : fitSin
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

%% Variables
maxDegree = 10;
C = cell(1,maxDegree); % coefficients
R = zeros(1,maxDegree); % norm of the residuals
%% Make Datepoints
X = -pi:0.1:pi;
Y = sin(X);

%% Make Figure
figure(1);
clf;
subplot(2,1,1);
scatter(X,Y);
hold on;
title('Original Sin Function & Fits');

%% Draw Fits
for degree = 0 : maxDegree
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
    Yfit = [];
    for i = 1 : numel(X)
        x = X(i);
        eval(['Yfit(i) = ', char(poly2sym(fliplr(C{degree + 1}'))),';']);
    end
    R(degree + 1) = norm(Yfit - Y);
    plot(X,Yfit);
end

%% Draw Legend
leg = {'Original'};
for degree = 0 : maxDegree
    eval(['leg{degree + 2} = ''Degree ',num2str(degree),''';']);
end
legend(leg);

%% Plot norm of the residuals
subplot(2,1,2);
bar(0:10,R);
xlabel('Degree');
ylabel('Norm');
title('Norm of the residuals');

%% Observation
% According to the second graph I plotted, after the Degree of 5,
% norm of the residuals are so small than other polynominals that I can not see
% the blue line from the graph.
% Also, polynominals which has a higher degree than 4 have relatively
% smaller coefficients of c4, c5, c6, ... , c10.
% Another finding is that in polynominals with degree higher than 3,
% coefficient for c1 and c3(x^1 and x^3's coefficient) was at least 100
% times larger than others.
% To conclude, coefficient for x^1 and x^3 is relatively important for
% fitting and Fitting Graph with degree 3 is enough in matter of smaller
% norm of the residuals and efficiency.