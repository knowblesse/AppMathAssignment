%% Assignment #6-1 : Image Fourier
%   Applied Mathematics 2016
%   Jeong Ji Hoon
%   ST_ID : 2016010980
%% JEONG_JIHOON
%   @Knowblesse
%   Created on 2016-12-03
%   Tested on Matlab 2016a

%% Initialization
clear; % close workspace
clear;
close all; % close all figures
clc; % close command window (output window of Matlab)

%% Load and Convert the Image
image = rgb2gray(imread('image.bmp'));

%% Display Fourier spectrum of the image
figure(1);
clf;
colormap gray;
imagesc(abs(fftshift(fft2(image))));

% Q: What do you see and How does it relate to the origianl image?
% A : I see 3 small dots.
% Since there is a pattern on every vertical lines of the image, 
% there should be a high fft value indicating high coefficient of
% that particular frequency content.

% Q: Can I predict/reconstruct the original striped pattern from the
% Fourier spectrum?
% A: I can predict the striped pattern, however can not reconstruct the
% image because the data shown by imagesc is the "abs" value of the fft
% function. This means phase information is lost therefore can not fully
% reconstruct it.

% Q: How can I predict it?
% A: Only small values have really high value, and located vertically. 
% So using that information, I can predict there is a only vertical pattern in
% the original image.

%% Log-transformed Spectrum
figure(2);
clf;
colormap gray;
imagesc(log(abs(fftshift(fft2(image)))));
% Q: Can you explain why you see this pattern?
% A: This pattern "Was" existed on the previous imagesc function.
% Since the log function is "monotonically increasing function" on x>0,
% this pattern was already there before taking the log of fft value.
% This is because values of the white dots(Max : 8322564) was too high
% relative to other values(below 1), Matlab's colormapping function
% accidently colored all small values to black. (Always have to check the color
% coded values to avoid this kind of mistakes!)
% Crossing Lines like X-axis and Y-axis is normally appears on nearly every
% image.(Caused by noise mostly)
% Two more horizontal lines are there because there is a pattern on every
% vertical lines of the image.