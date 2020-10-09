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

% create a uicontrol
hText_Kaishi = uicontrol('style','text', 'String','指导语', 'fontname','Microsoft Yahei', 'position',[301 500 200 60], 'fontsize',30, 'Backgroundcolor',bkgColor, 'ForegroundColor',fontColor);

tmpInstr = sprintf('这是一个图片观看任务，请你在看到一张图片的时候做出反应：\n如果你喜欢这张图片，请按左键 F ；\n如果你不喜欢这张图片，请按右键 J 。 ');
hText_Content = uicontrol('style','text', 'String',tmpInstr, 'fontname','Microsoft Yahei', 'position',[101 150 600 300], 'fontsize',20,'backgroundcolor',bkgColor, 'HorizontalAlign','left', 'ForegroundColor',fontColor);

tmpGo = '请按空格键开始正式实验。';
hText_Go = uicontrol('style','text', 'HorizontalAlign','center', 'String',tmpGo, 'fontname','Microsoft Yahei', 'position',[101 180 600 40], 'fontsize',20, 'Backgroundcolor',bkgColor, 'ForegroundColor',fontColor);

% snapshot
hFrame = getframe(gcf);
imgInstruction = hFrame.cdata;

jpgFileName_instruction = 'Instruction_Start.jpg';
jpgPathName_instruction = sprintf('%s/%s', picFolderName, jpgFileName_instruction);
imwrite(imgInstruction, jpgPathName_instruction, 'jpg');