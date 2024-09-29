alias gb="git branch"
alias gc="git commit"
alias gco="git checkout"
alias gs="git status"

function gpp {
	branch=$(git rev-parse --abbrev-ref HEAD)
	url="https://github.com/Radius-of-Self/paradigm/pull/new/$branch"

	git push --set-upstream origin "$branch"
	sleep 1
	open "$url"
}
