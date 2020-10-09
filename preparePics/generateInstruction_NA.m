% filename is:: generateInstruction_Start.m

% clear
clc; clear; close all;

% prepare picFolderName
picFolderName = 'Pics';

% prepare bkgColor
bkgColor = [0.5 0.5 0.5];
fontColor = [0 0 0];

% create a figure
hFigure = figure(1);
set(hFigure, 'position',[30 30 800 600],  'color', bkgColor);

% snapshot
hFrame = getframe(gcf);
imgInstruction = hFrame.cdata;

jpgFileName_instruction = 'NA.jpg';
jpgPathName_instruction = sprintf('%s/%s', picFolderName, jpgFileName_instruction);
imwrite(imgInstruction, jpgPathName_instruction, 'jpg');