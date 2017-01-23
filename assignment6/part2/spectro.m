%% Assignment #6-2 : Spectrogram
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
[data,fs] = audioread('funky_drummer_1.wav');
data=data(:,1); % only using left side data(mono) from stereo data

%% Fourier Fast Transformation
Y = fft(data);
L = size(data,1); % length of the Music File
fft_Freq = abs(Y/L); % Normalize with the signal length
fft_Freq = fft_Freq(1:floor(L/2)+1); % cut front half part 
f = fs * (0:floor(L/2))/L; % calculate frequency x lable values

%% Plot FFT Result
plot(f,log(fft_Freq));
xlabel('Frequency[Hz]');
ylabel('Amplitude');
% Label X axis tick
fig = gca;
fig.XTick = 0:2000:fs;
set(gca,'XTickLabel',num2str(get(gca,'XTick').'))

%% Get Peak Point
[~,maxIndex] = max(fft_Freq); % find peak 
maxFreq = f(maxIndex); % find peak's frequency
display(maxFreq);

% Peak of the signal's frequency is
%   about 72.60 Hz

%% Get Spectrogram Data
figure(2);
set(gcf,'position',[100,1000,1200,400]);
winSize = 1024;
stepsize = 10;

col = 1;
spectrogramData = []; % variable for spectogram data. each column corresponds to each time step.
for step = 1 : stepsize : size(data,1) - winSize
    Y = fft(data(step : step + winSize - 1));
    L = winSize; % length of the Music File
    fft_Freq = log10(abs(Y/L)); % Normalize with the signal length and take log 
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

roundedL = round(size(data,1)/fs,1); % rounded sound data length in second with 1 decimal point
xticksize = floor((roundedL*fs - winSize)/stepsize); % length of spectrogram which correspond to 0.1 sec
fig.XTick = (0:roundedL*10) / (roundedL*10) * (xticksize); % total roundedL*10 + 1 ticks
fig.XTickLabel = (0:0.1:roundedL);% Label the ticks by 0.1 sec manner

fig.YTick = fliplr(size(spectrogramData,1):-floor(size(spectrogramData,1)/11):0); % make 11 ticks (inc. 0)
fig.YTickLabel = fliplr(0 : floor((fs/2)/11) : (fs/2)); % label the ticks

%% Spectogram Player
pause(3); % wait for upper command to finish
p = audioplayer(data,fs);
RedLine = [];
tic;
play(p);

while toc < size(data,1)/fs
    % Used Other Method which I don't have to draw the spectrogram
    % every time. 
    
%     cla;
%     imagesc(spectrogramData);
%     title('Spectrogram [dB]');
%     xlabel('time[s]');
%     ylabel('frequency[Hz]');
%     fig = gca;
% 
%     fig.XTick = (0:roundedL*10) / (roundedL*10) * (xticksize); 
%     fig.XTickLabel = (0:0.1:roundedL);
% 
%     fig.YTick = fliplr(size(spectrogramData,1):-floor(size(spectrogramData,1)/11):0); % make 11 ticks (inc. 0)
%     fig.YTickLabel = fliplr(0 : floor((fs/2)/11) : (fs/2));

    hold on;
    delete(RedLine);
    currPos = toc * size(spectrogramData,2) * fs / size(data,1);
    RedLine = plot([currPos, currPos],[size(spectrogramData,1),size(spectrogramData,1)-100],'r','linewidth',2);
    drawnow;
end

%% Additional Observation and Question
% As you can see from the red line moving, firstly it moves a little
% bit faster then the music it self. 
% (Eventually it reaches at the end at the same time whn the music ends.)
% This phenomenon is not related to labeling of the axis nor plotting
% delay.
% Basic assumption when using the spectrogram as a background of the
% player, is that the length of the X-axis of the drawn spectrogram IS
% the length of the data itself. 
% But since fft needs a signal with some length to caculate the
% frequency, I think length of xaxis of spectrogram is not equal to
% the length of the data itself.
% Matlab's toolbox function "spectrogram()" also supports this idea
% because drawn spectrogram's maximum value of x axis is smaller than
% the length of the signal.
% Probabily, altering winSize or stepsize will ease this shifting
% probelm.

