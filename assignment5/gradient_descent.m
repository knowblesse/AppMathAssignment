function [ xoptimal, foptimal, niterations ] = gradient_descent( f, g1, g2, xstart, lambda, tolerance, maxiterations )
% Calculate the optimal point of the function f with given options
%   Input Parameters
%       f : Target Function
%       g1 : Partial Derivatives of f on x1
%       g2 : Partial Derivatives of f on x2
%       xstart : A point where gradient descent starts
%       lambda : Update Rate
%       tolerance : Squared norm of the gradient where the iteration
%                   stops
%       maxiterations : Maximum number of iterations allowed.
%   Output Parameters
%       xoptimal : Optimal point's x value
%       foptimal : Optimal point's y(f(x)) value
%       niterations : Number of iterations to reach the optimal value
%% Gradient Descent
prevx = xstart(1); % initial value of x1(i.e. x)
prevy = xstart(2); % initial value of x2(i.e. y)
currx = [];
curry = [];
for i = 1 : maxiterations % iterate until maxiterations. If the squared norm of the gradient go below the tolerance this loop can be stopped early.
    prevx = [prevx, currx];
    prevy = [prevy, curry];
    currx = prevx(end) - lambda * g1(prevx(end), prevy(end));
    curry = prevy(end) - lambda * g2(prevx(end), prevy(end));
    if (g1(currx, curry)^2 + g2(currx, curry)^2) <= tolerance
        break; % stop when the squared norm is smaller than the tolerance
    end
end

%% Output
xoptimal = [currx, curry];
foptimal = f(currx, curry);
niterations = i;

%% Plot the function and the trace of the optimal point in every iterations
figure(1);
clf;
ezsurf(f, [-15, 15, -15, 15]); % plot f
hold on;
plot3([prevx currx], [prevy curry], [f(prevx,prevy), f(currx,curry)], 'ro-');
title('Gradient Descent');
end

