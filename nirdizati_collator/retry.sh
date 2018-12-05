#!/usr/bin/env bash

function retry()
{
	local n=0
	local try=5
	local wait=10
	local cmd="$@"

    until [[ $n -ge $try ]]
    do
		sleep $wait;
		$cmd && break || {
			echo "Command Fail.."
			((n++))
			echo "Retry $n ::"
		}
    done
}

retry $*