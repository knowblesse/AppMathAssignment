%% Assignment #1-1 : Get JIHOON_JEONG's age in seconds and Save it into txt file
%   Applied Mathematics 2016
%   Jeong Ji Hoon
%   ST_ID : 2016010980
%% JEONG_JIHOON
%   @Knowblesse
%   Created on 2016-09-18
%   Last Modified on 2016-09-21
%% Initialization
clear; % close workspace
clear;
close all; % close all figures
clc; % close command window (output window of Matlab)
%% Initialize stuct variable
% Create a struct variable called "myInfo" and assign 5 entries.
myInfo.firstname = 'JEONG';
myInfo.lastname = 'JIHOON';
myInfo.birth_year = 1993;
myInfo.birth_month = 6;
myInfo.birth_day = 22;
%% Get current time
now = clock; % get current time
%% Variables (only for script code readability)
% diffInDays_year //difference between year values in days. ex) 2000,2010 => 3650 days
% diffInDays_month //difference between month values in days.
% diffInDays_day //difference between day values.
%% Get Difference between year values in days
diffInDays_year = 365*(now(1)-myInfo.birth_year);
%% Get Difference between month values in days
daysInMonth = [31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];% days in each month. ex) 28 days in Feburary, 31 in December
if myInfo.birth_month < now(2) % current month value is larger than the birthday's month value.
    diffInDays_month = sum(daysInMonth(myInfo.birth_month:(now(2)-1))); % simply add up the days in each month starting from birthday's month to (current month-1)
elseif myInfo.birth_month == now(2) % current month value is same with the birthday's month value.
    diffInDays_month = 0; % don't need to care about month
else % myInfo.birth_month > now(2) // current month value is smaller than the birthday's month value
    diffInDays_month = -sum(daysInMonth(now(2):(myInfo.birth_month-1))); % add up the days between two months and put minus sign. This value will be added up with the <diffInDays_year>.
    % ex) 2015/10 -> 2016/9 ===> not a year. but <diffInDays_year> is 365. so
    % this should be subtracted by adding <diffInDays_month> which has a
    % minus value.
end
clear daysInMonth;
%% Get Difference between day values
diffInDays_day = now(3) - myInfo.birth_day; % simply get the difference between day values. Minus value will be compensated with year and month value. 
%% Convert total day differences to second
diffInDays = diffInDays_year + diffInDays_month + diffInDays_day;
timeDiff = 24*60*60*diffInDays;
%% Add hour, minute, second data and assign to myInfo
timeDiff = timeDiff + 3600*now(4) + 60*now(5) + now(6); % add hour, minute, and second
myInfo.ageInSec = timeDiff; % add sixth entry to myInfo
%% Print Data
fprintf(sprintf('I am %.4f seconds old right now!\n',myInfo.ageInSec)) % print age in second data in fixed point format
%% Save Data
file = fopen('JEONG_JIHOON_myInfo.txt','w'); % open file
fprintf(file,'%s\n',myInfo.firstname);
fprintf(file,'%s\n',myInfo.lastname);
fprintf(file,'%d / %d / %d\n',myInfo.birth_year,myInfo.birth_month,myInfo.birth_day);
fprintf(file,sprintf('%.4f',myInfo.ageInSec));
fclose(file); % close file

