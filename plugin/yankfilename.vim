vim9script

import autoload '../autoload/yankfilename.vim'

command! YankFileName yankfilename.YankFileName()
command! YankFileNameForDebug yankfilename.YankFileNameForDebug()
command! YankGithubURLMaster yankfilename.YankGithubURL(true)
command! YankGithubURL yankfilename.YankGithubURL(false)
