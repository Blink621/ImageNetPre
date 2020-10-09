function y = Instruction(p_window,InsPic)

Screen('PutImage',p_window, InsPic);
Screen('Flip',p_window);

key_Space=KbName('Space');
while 1
    [~, key_Code, ~]=KbWait([], 3);     %¼àÌý°´¼ü
    if key_Code(key_Space)
        break;
    end
end

Screen('FillRect',p_window,[128 128 128]);  
Screen('Flip',p_window);

end

