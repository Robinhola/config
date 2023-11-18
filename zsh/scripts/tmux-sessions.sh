#!/bin/sh

truncate_paths () {
	echo $1 |  sed 's/\([A-Za-z]\)[A-Za-z0-9_\-]*\//\1\//g'
}

folders="""robin
test"""

projects=$(find ~/Projects/* -maxdepth 1 -type d -not -name '.*')

choice=$(echo "$folders\n$projects" | sort | uniq | fzf)

if ! tmux has-session -t "$choice" 2>/dev/null; then
	tmux new-session -d -c $choice -s $choice
fi

tmux switch-client -t $choice
