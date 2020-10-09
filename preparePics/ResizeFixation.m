% filename is:: drawFixation.m

% usage:: draw the fixation material, in .jpg format

% clear
clc;clear; close all;


% prepare the material folder
picsFolderName = 'Pics';
fixationFileName = 'fixation.jpg';
fixationPathName = sprintf('%s/%s', picsFolderName, fixationFileName);
pixel = 20;
% prepare fixation color
bkgColor = [0.5 0.5 0.5];

imgdata = imread(fixationPathName);
imgDeel = imresize(imgdata, [pixel pixel]);
imwrite(imgDeel, sprintf('%s/%s', picsFolderName, 'fixation_resize.jpg'), 'jpg');
imshow(imgDeel);


% [imgPic, map, alpha] = imread(fixationPathName);
% [imgHeight, imgWidth, ~] = size(imgPic);
% 
% % get screensize
% scrSize = get(0, 'ScreenSize');
% scrWidth = scrSize(3);
% scrHeight = scrSize(4);
% 
% % prepare a figure
% figWidth = 500;
% figHeight = 500;
% figX = (scrWidth - figWidth) / 2;
% figY = (scrHeight - figHeight) / 2;
% hFigure = figure(1);
% set(hFigure, 'position', [figX figY figWidth figHeight]);
% 
% % % prepare BKG axes and image
% % hAxes_BKG = axes('parent', hFigure);
% % set(hAxes_BKG, 'units', 'pixels', 'position', [1 1 figWidth figHeight])
% % imgBKG = ones(figHeight, figWidth, 3);
% % imshow(imgBKG, 'parent', hAxes_BKG);
% 
% % prepare Pic axes and image
% imgX = (figWidth - imgWidth) * 0.5;
% imgY = (figHeight - imgHeight)  * 0.75;
% hAxes_Pic = axes('parent', hFigure);
% set(hAxes_Pic, 'units', 'pixels', 'position', [imgX imgY imgWidth imgHeight])
% f = imshow(imgPic, 'parent', hAxes_Pic);
% set(f, 'AlphaData', alpha)
