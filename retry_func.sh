#!/bin/bash

# Retries a command on failure.
# $1 - the max number of attempts
# $2 - the time to wait before the next attempt
#		(use 0 to use an incremental wait based on the current num attempts)
# $3... - the command to run
retry() {
    local -r -i max_attempts="$1"; shift
    local -i wait_for="$1"; shift
    local -r cmd=("$@")
    local -i attempt_num=1
    local -i incremental_delay=0;

    if (( wait_for == 0 )); then
        local -i incremental_delay=1;
    fi
        
    until "${cmd[@]}"; do
		retval=$?
        if (( attempt_num == max_attempts )); then
            echo "Attempt $attempt_num failed and there are no more attempts left!"
            exit $retval
        else
			if (( incremental_delay == 1 )); then
				(( wait_for += attempt_num ))
			fi
            echo "Attempt $attempt_num failed! Trying again in $wait_for seconds..."
            (( attempt_num++ ))
            sleep $wait_for
        fi
    done
}
