augroup BetterFocus
  au!
  au VimEnter * call autocmds#vim_enter()
  " Active | inactive windodw
  au BufEnter,FocusGained,VimEnter,WinEnter * call window#focus()
  au FocusLost,WinLeave * call window#blur()
  " Statusline
  au BufWinEnter,BufAdd,FocusGained,VimEnter,WinEnter * call statusline#focus()
  au FocusLost,WinLeave * call statusline#blur()
  " Don't show number in vifm/twf
  au TermEnter * setlocal nonu norelativenumber
augroup end

augroup Miscellaneous
  au!
  " Don't help me to auto comment newline
  au FileType * setlocal fo-=c fo-=r fo-=o
  " Remove trailing space on save
  au BufWritePre * StripWhitespace
  " If path doesn't exist, just create it
  au BufWritePre,FileWritePre * silent! call mkdir(expand('<afile>:p:h'), 'p')
  " Highlight yanked content for 500 ms and send OSC52 seqs to tty
  au TextYankPost * call autocmds#yank_post()
  " change layout when nvim window resize
  au VimResized * if &ft != 'man' | execute('wincmd =') | endif
  " Update signature help on jump placeholder.
  au User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

augroup BufTabLine
  autocmd!
  autocmd VimEnter  * call buftabline#update(0)
  autocmd TabEnter  * call buftabline#update(0)
  autocmd BufAdd    * call buftabline#update(0)
  autocmd FileType qf call buftabline#update(0)
  autocmd BufDelete * call buftabline#update(str2nr(expand('<abuf>')))
augroup END
