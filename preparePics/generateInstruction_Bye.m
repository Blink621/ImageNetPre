% filename is:: generateInstruction_Bye.m

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

% create a uicontrol
hText_Kaishi = uicontrol('style','text', 'String','实验结束', 'fontname','Microsoft Yahei', 'position',[201 450 350 80], 'fontsize',40, 'Backgroundcolor',bkgColor, 'ForegroundColor',fontColor);

tmpInstr = sprintf('感谢你的参与，去领取被试费吧！:) ');
hText_Content = uicontrol('style','text', 'String',tmpInstr, 'fontname','Microsoft Yahei', 'position',[121 120 540 250], 'fontsize',20,'backgroundcolor',bkgColor, 'HorizontalAlign','center', 'ForegroundColor',fontColor);

tmpGo = '请按空格键退出。';
hText_Go = uicontrol('style','text', 'HorizontalAlign','center', 'String',tmpGo, 'fontname','Microsoft Yahei', 'position',[101 100 600 50], 'fontsize',20, 'Backgroundcolor',bkgColor, 'ForegroundColor',fontColor);

% snapshot
hFrame = getframe(gcf);
imgInstruction = hFrame.cdata;

jpgFileName_instruction = 'Instruction_Bye.jpg';
jpgPathName_instruction = sprintf('%s/%s', picFolderName, jpgFileName_instruction);
imwrite(imgInstruction, jpgPathName_instruction, 'jpg');