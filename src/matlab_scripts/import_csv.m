%%AR MQP - Anthony Dresser, Lukas Hunker, Andrew Weiler
%%	import_csv.m
%%	Imports a  barrel projection LUT as a csv file generated by XSim 
%%	and performs barrel projection with it

%% Import data from spreadsheet
% Script for importing data from the following spreadsheet:
%
%    Workbook: ./output.csv Worksheet: output

% Auto-generated by MATLAB on 2016/02/28 15:33:26

%% Import the data
[~, ~, rawX] = xlsread('output.csv','output','C2:C1036801');
[~, ~, rawY] = xlsread('output.csv','output','D2:D1036801');

%% Replace non-numeric cells with 0.0
RX = cellfun(@(x) ~isnumeric(x) || isnan(x),rawX); % Find non-numeric cells
RY = cellfun(@(x) ~isnumeric(x) || isnan(x),rawY); % Find non-numeric cells
rawX(RX) = {0.0}; % Replace non-numeric cells
rawY(RY) = {0.0}; % Replace non-numeric cells

%% Create output variable
rawX = cell2mat(rawX);
rawY = cell2mat(rawY);

%% Reformat
hwLUT = zeros(960, 1080, 2);

for y=1:1080
    for x=1:960
        hwLUT(x,y,1)=rawX((x-1)*1080+y);
        hwLUT(x,y,2)=rawY((x-1)*1080+y);
    end
end

hwLUT(~hwLUT) = 1;%Round up any zeros to 1

%% Clear temporary variables
clearvars x y untitled RX RY;

%% DoLUT
Iin=imread('Koala.jpg');
Iout=doLUT(Iin,hwLUT);
imwrite(Iout, 'KoalaOut.bmp');