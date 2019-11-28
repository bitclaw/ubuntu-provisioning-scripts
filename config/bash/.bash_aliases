alias test-web="cd ~/code/test/test-web"

[branch]
	autosetuprebase = always
[core]
	autocrlf = input
	editor = vim
[filter "lfs"]
	required = true
	clean = git-lfs clean -- %f
	smudge = git-lfs smudge -- %f
	process = git-lfs filter-process
