#!/bin/bash

if [ -z $1 ]; then
	echo "Please enter file name"
else
	tmux new-session -d -s $1 #Create the new session with the name of the target-list
	for i in `cat $1`;do
		name=`echo $i | sed s/[.]/-/g`
		tmux new-window -t $1 -n $name #Create the new windows in session with the name of each target
		tmux send-keys -t $1:$name "<command-to-execute> $i" C-m #Send the command and the targets to the windows
	done
fi
