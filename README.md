# vim-yank-filename
vim plugin: yank filename. Local path, for debug in chrome. Git url, git url to master branch

### Commands

`YankFileName` - yank current filename with path: 'path/to/dir/filename.txt'
`YankFileNameForDebug` - yank filename with path, omit first dir. Append line number: 'to/dir/filename.txt:10' (used for pasting in Chrome devtools)
`YankGithubURL` - yank github/gitlab/gitea url to current file, with line number.
`YankGithubURLMaster` - yank github url to current file, with line number, but use master branch in url
