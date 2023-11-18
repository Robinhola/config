#!/bin/sh

function goto {
	session=$1
	if ! [ -n "$session" ]; then
		echo oops
		exit 1
	fi

	if [ -n "$TMUX" ]; then
		tmux switch-client -t $session
	else
		tmux attach-session -t $session
	fi
}

function tn {
	session=$1
	if ! [ -n "$session" ]; then
		session="Robin"
	fi

	if ! tmux has-session -t $session 2> /dev/null; then
		tmux new-session -d -t $session
	fi

	goto $session
}

function choose_session {
	preview='tmux list-windows -t {} -F "#S - #W #{?window_active,⬅,}"'
	tmux list-sessions -F '#{session_name}' | fzf --preview="$preview"
}

function tt {
	session=$(choose_session)
	goto $session
}

function tk {
	session=$(choose_session)
	tmux kill-session -t $session
}
