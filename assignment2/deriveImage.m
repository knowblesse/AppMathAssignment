%% Assignment #2-2 : Derivatives, images, plotting
%   Applied Mathematics 2016
%   Jeong Ji Hoon
%   ST_ID : 2016010980
%% JEONG_JIHOON
%   @Knowblesse
%   Created on 2016-10-05
%   Last Modified on 2016-10-05
%% Initialization
clear; % close workspace
clear;
close all; % close all figures
clc; % close command window (output window of Matlab)
colormap gray; % set color map
%% function imf
imf = @(x,y) and(and(x>=30,x<=70),and(y>=30,y<=70)); % true only if x is between 30 and 70, AND y is between 30 and 70.
%% Create Image
[x,y] = meshgrid(1:100,1:100);
img = double(imf(x,y)); % create square
figure(1);
clf;
imagesc(img); % Draw Image
title('Original Image');
%% Derive Image
% by x 
for row  = 1 : 100
    dx(row,:) = diff(img(row,:));
end
% by y
for col  = 1 : 100
    dy(:,col) = diff(img(:,col));
end
%% Draw Derived Image
% by x
figure(2);
clf;
imagesc(dx);
title('Derived by x');
colormap gray; % set color map
% by y
figure(3);
clf;
imagesc(dy);
title('Derived by y');
colormap gray; % set color map
%% Bonus
img = imread('pic.jpg');% load Image
img = imresize(img,[100,100]);% reduce size to 100 pixel x 100 pixel
img = double(rgb2gray(img));% make gray scale image
figure(4);
clf;
imagesc(img);
title('Origianl Image');
colormap gray; % set color map
% Derive Image by x
for row  = 1 : 100
    dx(row,:) = diff(img(row,:));
end
% Derive Image by x
for col  = 1 : 100
    dy(:,col) = diff(img(:,col));
end
% Draw Derived Image by x
figure(5);
clf;
imagesc(dx);
title('Derived by x');
colormap gray; % set color map
% Draw Derived Image by y
figure(6);
clf;
imagesc(dy);
title('Derived by y');
colormap gray; % set color map





