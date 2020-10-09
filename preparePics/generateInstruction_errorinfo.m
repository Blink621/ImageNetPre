% filename is:: generateInstruction_errorinfo.m

% clear
clc; clear; close all;

% prepare picFolderName
picFolderName = 'Pics';

if ~exist(picFolderName, 'dir')
    mkdir(picFolderName);
end

% prepare bkgColor
bkgColor = [0 0 0];
fontColor = [1 1 1];

% create a figure
hFigure = figure(1);
set(hFigure, 'position',[100 50 300 300], 'color',bkgColor);    % scale 16:9
 
% create a uicontrol
hText_Kaishi = uicontrol('Style','Text', 'String','·´Ó¦´íÎó£¡', 'Fontname','Microsoft Yahei', 'Position',[20 80 300 100], 'Fontsize',36, 'Backgroundcolor',bkgColor, 'ForegroundColor',fontColor);

% snapshot
hFrame = getframe(gcf);
imgInstruction = hFrame.cdata;

jpgFileName_instruction = 'Errorinfo.jpg';
jpgPathName_instruction = sprintf('%s/%s', picFolderName, jpgFileName_instruction);
imwrite(imgInstruction, jpgPathName_instruction, 'jpg');
