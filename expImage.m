% the whole experiment 
function expImage(sub, session)
%�������'SYNCHORIZATION FAILURE!!!'�ɽ����м���ע�͸ĳ������ѹ�ƴ˾���
Screen('Preference', 'SkipSyncTests', 2);
Screen('Preference','VisualDebugLevel',4);
Screen('Preference','SuppressAllWarnings',1);

% prepare foldernames and params
picsFolderName = 'Pics';
outFolderName = 'out';
stimulusFolder = 'SelectedImages';
stimOrderFolder = 'stimSameCategory';
column_sub = 1;
column_session = 2;
column_run = 3;
column_trail = 4;
column_id = 5;
imgPixel = 800;
run_per_session = 10;
trial_per_run = 128;

try
% load start image
jpgFileName_Instruction = 'Instruction_Start.jpg';
jpgPathName_Instruction = sprintf('%s/%s', picsFolderName, jpgFileName_Instruction);
imgMat_Instruction = imread(jpgPathName_Instruction);

% prepare color for background
bkgColor = [128 128 128];
[wptr, rect] = Screen('OpenWindow', 0, bkgColor);

% �رռ��̼���
ListenChar(2);

% ����
HideCursor;

% show the instruction
Instruction(wptr, imgMat_Instruction);

% ׼����fixation��ͼ��
fixationFileName = 'fixation.jpg';
fixationPathName = sprintf('%s/%s', picsFolderName, fixationFileName);
fixation_imgMatrix = imread(fixationPathName);

% open a .txt file for store the data
outPath = sprintf('%s/sub%d', outFolderName, sub);
if ~exist(outPath,'dir')
    mkdir(outPath);
end
txtFileName_Result = sprintf('%s/expImage_sub%d_session%d.txt', outPath, sub, session);
fid = fopen(txtFileName_Result, 'w+');
fclose(fid);

% start trail
for runIndex = 1:run_per_session
    % load stimulus
    stimPath = sprintf('%s/sub%d/session%d/stim_run%d.mat', stimOrderFolder, sub, session, runIndex);
    stimStruct = load(stimPath);
    stimAll = stimStruct.stimAll;
    % LOOP to present stimulus
    for trailIndex = 1:size(stimAll, 1) 
        picName = stimAll{trailIndex};
        if strcmp(picName, 'NA')
            imgPath = sprintf('%s/%s', picsFolderName, 'NA.jpg');
        else
            imgPath = sprintf('%s/%s', stimulusFolder, picName);
        end
        
        imgMat = imread(imgPath);
        imgResize = imresize(imgMat, [imgPixel imgPixel]);
        response = singleTrial(wptr, fixation_imgMatrix, imgResize);
        % ����ʱʹ��
        if strcmp(response, 'break')
            break;
        end
        
        % write response info into table
        tmpArr = [sub session runIndex trailIndex response];
        tmpLine = sprintf('%d,%d,%d,%d,%d,%s', tmpArr, picName);

        fid = fopen(txtFileName_Result, 'a+');
        fprintf(fid, '%s\r\n', tmpLine);
        fclose(fid);        
    end

    % ��ʾ��Ϣ��ͼƬ
    imgRestPath = sprintf('%s/%s', picsFolderName, 'Instruction_Rest.jpg');
    imgRestMat = imread(imgRestPath);
    % �ȴ����԰�������
    Instruction(wptr, imgRestMat);
    % ����ʱʹ��
    if strcmp(response, 'break')
        break;
    end
end
    
% filename
jpgFileName_Instruction = 'Instruction_Bye.jpg';
jpgPathName_Instruction = sprintf('%s/%s', picsFolderName, jpgFileName_Instruction);
imgMat_Instruction_Bye = imread(jpgPathName_Instruction);
Instruction(wptr, imgMat_Instruction_Bye);

% ��ʾ���
ShowCursor;

% �رռ��̼���
ListenChar(1);

% �رմ���
Screen('CloseAll');

catch
    
%��ʾ���
ShowCursor;

% �رռ��̼���
ListenChar(1);

% �رմ���
Screen('CloseAll');
Priority(0);
psychrethrow(psychlasterror);

end
end