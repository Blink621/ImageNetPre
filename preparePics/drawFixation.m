% filename is:: drawFixation.m

% usage:: draw the fixation material, in .jpg format

% clear
clc;clear; close all;


% prepare the material folder
picsFolderName = 'Pics';

if ~exist(picsFolderName,'dir')
     mkdir(picsFolderName);
end

% prepare fixation color
bkgColor = [0.5 0.5 0.5];

% prepare the width and height of the figure and fixation
figWidth = 200;
figHeight = 200;
fixationWidth = 50;
fixationHeight = 50;

% create a figure
hFigure = figure(1);
set(hFigure, 'position', [100 100 figWidth figHeight],'color',bkgColor);

% create an axes, and put it in the middle horizontally and vertically
hAxes = axes('parent',hFigure);
% hAxes_PosX = (figWidth - fixationWidth)/2 + 1;
% hAes_PosY = (figHeight - fixationHeight)/2 x+ 1;
set(hAxes, 'units','pixels', 'position',[1 1 200 200]);

% generate image matrix, in Black
imgMatrix = zeros(fixationHeight, fixationWidth, 3);
% imgMatrix(:) = 0.5;
% imgMatrix(21:30,:,1) = 0;   % r
% imgMatrix(21:30,:,2) = 0;   % g
% imgMatrix(21:30,:,3) = 0;   % b
% 
% imgMatrix(:,21:30,1) = 0;   % r
% imgMatrix(:,21:30,2) = 0;   % g
% imgMatrix(:,21:30,3) = 0;   % b
% 
% show image
imshow(imgMatrix, 'parent',hAxes);

% get frame
hFrame = getframe(gcf);
hImage_Fixation = hFrame.cdata;

% save
fixationFileName = 'fixation.jpg';
fixationPathName = sprintf('%s/%s', picsFolderName, fixationFileName);
imwrite(hImage_Fixation, fixationPathName, 'jpg');