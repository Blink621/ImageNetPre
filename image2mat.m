stimulusFolder = 'SelectedImages';

% define columns
picsFolderName = 'stimSameCategory';
column_sub = 1;
column_session = 2;
column_run = 3;
column_trail = 4;
column_id = 5;
trial_per_run = 128;

% load stimulus matrix
for sub = 1:20
    for session = 1:4
        matrix = load_matrix(sub, session);
        for runIndex = 1:max(matrix{:,column_run})
            imgMatCell = {};
            matTrail = matrix(matrix{:,column_run}==runIndex, :);
            picAll = matTrail{:,column_id};
            stimAll = cell(trial_per_run,1);
            % construct new design
            for trailIndex = 1:120
                if mod(trailIndex, 6) == 0
                    stimAll{trailIndex+4} = 'NA';
                else
                    num = randperm(size(picAll, 1), 1);
                    picName = picAll{num};
                    picAll(num) = [];
                    stimAll{trailIndex+4} = picName;
                end
            end
            stimAll(1:4) = {'NA'};
            stimAll(125:128) = {'NA'};
            
%             for trailIndex = 1:size(stimAll, 1)
%                 picName = stimAll{trailIndex};
%                 if strcmp(picName, 'NA')
%                     imgPath = sprintf('%s/%s', picsFolderName, 'NA.jpg');
%                 else
%                     imgPath = sprintf('%s/%s', stimulusFolder, picName);
%                 end
% 
%                 imgMat = imread(imgPath);
%                 imgMatCell{trailIndex} = imgResize;
%             end
            outPath = sprintf('%s/sub%d/session%d', picsFolderName, sub, session);
            if ~exist(outPath,'dir')
                mkdir(outPath);
            end
            
            stimName = sprintf('%s/stim_run%d.mat', outPath, runIndex);
            save(stimName, 'stimAll');
            clear stimAll;
        end

    end
end
