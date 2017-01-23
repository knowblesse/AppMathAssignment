%% Assignment #3-2 : TrussAndPlate
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
%% A
A = [-cosd(30),0,cosd(60),0,0,0;...
    -sind(30),0,-sind(60),0,0,0;...
    cosd(30),1,0,1,0,0;...
    sind(30),0,0,0,1,0;...
    0,-1,-cosd(60),0,0,0;...
    0,0,sind(60),0,0,1];
b = [0;-1000;0;0;0;0];
Answer = GaussSolve(A,b);
fprintf('Answer 2-1 : \n');
fprintf('F1 : %fkg\nF2 : %fkg\nF3 : %fkg\nH2 : %fkg\nV2 : %fkg\nV3 : %fkg\n',Answer(1:6));

%% B
A = [4,-1,-1,0;...
    -1,4,0,-1;...
    -1,0,4,-1;...
    0,-1,-1,4];
b = [45;40;55;50];
Answer = GaussSolve(A,b);
fprintf('Answer 2-2 : \n');
fprintf('x1 : %fdegrees\nx2 : %fdegrees\nx3 : %fdegrees\nx4 : %fdegrees\n',Answer(1:4));



