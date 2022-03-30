function s --description "s <cmd> <args> or <cmd> <args>; s ; play a beep after successfully running cmd and args (or checking previous status), three beeps after failure"
    set prev_status $status
    if count $argv > /dev/null
	if eval $argv
	    set success 0
	else
	    set success $status
	end
    else 
	if [ $prev_status = 0 ]
	    set success 0
	else
	    set success $prev_status
	end
    end
	
    if [ $success = 0 ]
	afplay /System/Library/Sounds/Glass.aiff &
    else
	afplay /System/Library/Sounds/Purr.aiff &
    end
    return $success
end


