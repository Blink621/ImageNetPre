function matrix = loadMatrix(sub, session)

stimulusPath = 'stimulus.csv';
stimAll = readtable(stimulusPath, 'Delimiter', ',');

% define columns
column_sub = 1;
column_session = 2;
column_run = 3;
column_trail = 4;
column_id = 5;

% filter the data for target subject and session
matrix = stimAll(stimAll{:,column_sub}==sub & stimAll{:,column_session}==session, :);
end

