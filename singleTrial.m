function response = singleTrial(wptr, imgMatrix_Fixation, imgMat, picName)
% Define the keyboard and present images for single trail
% F - like - 1  J - dislike - 0  None response - -1
% Note it's the debug version now, which means the onset time will be
% useless

% prepare time parameters
stimulus_onset = 0.2;
blank_Interval = 0.3;

% ���ð�����׼�����
KbName('UnifyKeyNames');

% ׼��������������ָ��
KeyPressArray = [KbName('f') KbName('j')];      

% show the fixation  
Screen('PutImage',wptr, imgMatrix_Fixation);
Screen('Flip',wptr);
WaitSecs(blank_Interval);    

% show the corresponding stimuli
Screen('PutImage',wptr, imgMat);
Screen('PutImage',wptr, imgMatrix_Fixation);
Screen('Flip',wptr);

t0 = GetSecs;   %������ʱ��

while 1     %�ȴ����Է�Ӧ
    [~, ~, key_Code] = KbCheck;      %��������
    
    % �������Ϊ f j �����е�����һ��
    if key_Code(KbName('f'))
        response = 1;
        break
    elseif key_Code(KbName('j'))
        response = 0;
        break
    else 
        response = -1;
    end

    % �������ΪESC ����״̬
    if key_Code(KbName('ESCAPE')) 
        response = 'break';
        break;
    end
    
    %�̶�һ��ʱ���ͼƬ��ʧ
    if strcmp(picName, 'NA')
        tt = GetSecs;   %������ʱ��
        if tt-t0>stimulus_onset
            break
        end
    end
    
end

end