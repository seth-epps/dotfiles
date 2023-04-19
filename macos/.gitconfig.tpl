[user]
	name = Seth Epps
	email = seth.d.epps@gmail.com

[includeIf "gitdir:~/dev/${JOB_WORKSPACE}/"]
    path = .gitconfig-${JOB_WORKSPACE}
