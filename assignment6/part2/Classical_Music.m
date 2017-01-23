%% Assignment #6-3 : Classical_Music
%   Applied Mathematics 2016
%   Jeong Ji Hoon
%   ST_ID : 2016010980

%% JEONG_JIHOON
%   @Knowblesse
%   Created on 2016-12-06
%   Tested on Matlab 2015a

%% Initialization
clear; % close workspace
clear;
close all; % close all figures
clc; % close command window (output window of Matlab)

%% Load Sound File
[data,fs] = audioread('Vivaldi.wav');
data=data(:,1); % only using left side data(mono) from stereo data

%% Fourier Fast Transformation
Y = fft(data);
L = size(data,1); % length of the Music File
fft_Freq = abs(Y/L); % Normalize with the signal length
fft_Freq = fft_Freq(1:floor(L/2)+1); % cut front half part 
f = fs * (0:floor(L/2))/L; % calculate frequency x lable values

%% Get Spectrogram Data
figure(1);
set(gcf,'position',[100,1000,1200,400]);
winSize = 1024;
stepsize = 100;

col = 1;
spectrogramData = []; % variable for spectogram data. each column corresponds to each time step.
for step = 1 : stepsize : size(data,1) - winSize
    Y = fft(data(step : step + winSize - 1));
    L = winSize; % length of the Music File
    fft_Freq = log(abs(Y/L)); % Normalize with the signal length and take log 
    fft_Freq = fft_Freq(1:floor(L/2)+1); % cut front half part 
    spectrogramData(:,col) = flipud(fft_Freq);
    col = col + 1;
end

%% Plot Spectrogram
imagesc(spectrogramData);
title('Spectrogram [dB]');
xlabel('time[s]');
ylabel('frequency[Hz]');
fig = gca;

roundedL = round(size(data,1)/fs); % rounded sound data length in second
xticksize = floor((roundedL*fs - winSize)/stepsize); % length of spectrogram which correspond to 1 sec
fig.XTick = (0:roundedL) / (roundedL) * (xticksize); % total roundedL + 1 ticks
fig.XTickLabel = (0:1:roundedL);% Label the ticks by 1 sec manner

fig.YTick = fliplr(size(spectrogramData,1):-floor(size(spectrogramData,1)/11):0); % make 11 ticks (inc. 0)
fig.YTickLabel = fliplr(0 : floor((fs/2)/11) : (fs/2)); % label the ticks

%% Spectogram Player
pause(3); % wait for upper command to finish
p = audioplayer(data,fs);
RedLine = [];
tic;
play(p);

while toc < size(data,1)/fs

    hold on;
    delete(RedLine);
    currPos = toc * size(spectrogramData,2) * fs / size(data,1);
    RedLine = plot([currPos, currPos],[size(spectrogramData,1),size(spectrogramData,1)-100],'r','linewidth',2);
    drawnow;
end

