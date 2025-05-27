vim9script

export def YankFileName()
    var filename = expand("%:.")
    setreg('*', filename)
    setreg('+', filename)
    echo 'yanked: "' .. filename .. '"'
enddef

export def YankFileNameForDebug()
    var filename = expand("%:.")->split('/')[1 : ]->join('/') .. ':' .. line('.')
    setreg('*', filename)
    setreg('+', filename)
    echo 'yanked: "' .. filename .. '"'
enddef


# https://github.com/[owner]/[repo]/blob/[git branch]/[filename]#L[lineNr]
export def YankGithubURL(isMasterBranch: bool)
    # also may be CocCommand git.copyUrl

    # git@github.com:[owner]/[repo].git
    var remoteUrl = system('git remote get-url --push origin')
    remoteUrl = substitute(remoteUrl, '[\r\n]', '', '')
    remoteUrl = substitute(remoteUrl, 'git@', '', '')
    remoteUrl = substitute(remoteUrl, '\.git', '', '')
    remoteUrl = substitute(remoteUrl, ':', '/', '')
    remoteUrl = substitute(remoteUrl, 'ssh\/\/\/', '', '')
    remoteUrl = substitute(remoteUrl, '\:\d\+', '', '')

    var branchName = isMasterBranch ? 'master' : systemlist('git rev-parse --abbrev-ref HEAD')[0]
    var filename = expand("%:.")
    var lineNr = line('.')

    var blob = remoteUrl =~ 'gitea' ? '/src/branch/' : '/blob/'
    var result = remoteUrl .. blob .. branchName .. '/' .. filename .. '#L' .. lineNr

    setreg('*', result)
    setreg('+', result)
    echo 'yanked: "' .. result .. '"'
enddef
