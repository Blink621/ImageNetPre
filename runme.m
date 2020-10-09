function runme(sub, session)
% Present ImageNet images for each category and get fMRI signal
%
% Inputs (necessary):
%   1) sub -- Subject id (1-20)
%   2) session -- Session id (1-4)

% Version 1.1 2020/10/09
% DNNBrain dev Team
% Department of Psychology, Beijing Normal University 

% clear
clc; clear; close all;

% load subject id and session id
% subject id
if nargin < 1
    sub = [];
    while isempty(deblank(sub))
        sub = input('Subject id : ', 's');
    end
end

% session name
if nargin < 1
    session = [];
    while isempty(deblank(session))
        session = input('Session id : ', 's');
    end
end

sub = str2num(sub);
session = str2num(session);

if sub > 20 || session >4
    error('Please check your subject and session id!')
end

% run the whole experiment
expImage(sub, session);
end

