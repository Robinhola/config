#!/bin/sh

function goto {
	session=$1
	if ! [ -n "$session" ]; then
		return 1
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

function map_s {
	f="$1"
	if ! [ -n "$f" ]; then
		return 1
	fi
	session=$(choose_session)
	if ! [ -n "$session" ]; then
		return 0
	fi
	$f $session
}

function tt {
	map_s goto
}

function tk {
	map_s "tmux kill-session -t"
}
