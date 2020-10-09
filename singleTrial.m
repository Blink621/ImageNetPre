function response = singleTrial(wptr, imgMatrix_Fixation, imgMat, picName)
% Define the keyboard and present images for single trail
% F - like - 1  J - dislike - 0  None response - -1
% Note it's the debug version now, which means the onset time will be
% useless

% prepare time parameters
stimulus_onset = 0.2;
blank_Interval = 0.3;

% 设置按键的准备情况
KbName('UnifyKeyNames');

% 准备好两个按键的指向
KeyPressArray = [KbName('f') KbName('j')];      

% show the fixation  
Screen('PutImage',wptr, imgMatrix_Fixation);
Screen('Flip',wptr);
WaitSecs(blank_Interval);    

% show the corresponding stimuli
Screen('PutImage',wptr, imgMat);
Screen('PutImage',wptr, imgMatrix_Fixation);
Screen('Flip',wptr);

t0 = GetSecs;   %启动计时器

while 1     %等待被试反应
    [~, ~, key_Code] = KbCheck;      %监听按键
    
    % 如果按键为 f j 两个中的任意一个
    if key_Code(KbName('f'))
        response = 1;
        break
    elseif key_Code(KbName('j'))
        response = 0;
        break
    else 
        response = -1;
    end

    % 如果按键为ESC 调试状态
    if key_Code(KbName('ESCAPE')) 
        response = 'break';
        break;
    end
    
    %固定一段时间后图片消失
    if strcmp(picName, 'NA')
        tt = GetSecs;   %启动计时器
        if tt-t0>stimulus_onset
            break
        end
    end
    
end

end