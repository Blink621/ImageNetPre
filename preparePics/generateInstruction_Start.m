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
hText_Kaishi = uicontrol('style','text', 'String','ָ����', 'fontname','Microsoft Yahei', 'position',[301 500 200 60], 'fontsize',30, 'Backgroundcolor',bkgColor, 'ForegroundColor',fontColor);

tmpInstr = sprintf('����һ��ͼƬ�ۿ����������ڿ���һ��ͼƬ��ʱ��������Ӧ��\n�����ϲ������ͼƬ���밴��� F ��\n����㲻ϲ������ͼƬ���밴�Ҽ� J �� ');
hText_Content = uicontrol('style','text', 'String',tmpInstr, 'fontname','Microsoft Yahei', 'position',[101 150 600 300], 'fontsize',20,'backgroundcolor',bkgColor, 'HorizontalAlign','left', 'ForegroundColor',fontColor);

tmpGo = '�밴�ո����ʼ��ʽʵ�顣';
hText_Go = uicontrol('style','text', 'HorizontalAlign','center', 'String',tmpGo, 'fontname','Microsoft Yahei', 'position',[101 180 600 40], 'fontsize',20, 'Backgroundcolor',bkgColor, 'ForegroundColor',fontColor);

% snapshot
hFrame = getframe(gcf);
imgInstruction = hFrame.cdata;

jpgFileName_instruction = 'Instruction_Start.jpg';
jpgPathName_instruction = sprintf('%s/%s', picFolderName, jpgFileName_instruction);
imwrite(imgInstruction, jpgPathName_instruction, 'jpg');