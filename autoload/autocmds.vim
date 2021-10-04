function! autocmds#vim_enter() abort
  set stl=%#Normal#
  exec "WipeReg"
  call git#cd(expand("%"))
  if &ft=="fugitive" | wincmd o | return | endif
  if argc() == 0 | execute('Files') | return | endif
endfunction

function! autocmds#yank_post() abort
  lua vim.highlight.on_yank { "IncSearch", 700 }
  if v:event.operator !~ "y" | return | endif
  call system('xclip -selection clipboard', @0)
  if !has("Darwin") || !exists("g:tty") | return | endif
  " Inspired by https://github.com/fcpg/vim-osc52/blob/master/plugin/osc52.vim
  " For better understanding OSC 52: https://invisible-island.net/xterm/ctlseqs/ctlseqs.html
  let buffer=system('base64', @0)
  let buffer=substitute(buffer, "\n", "", "")
" Now wrap the whole thing in <start-dcs><start-osc52>...<end-osc52><end-dcs>.
  let buffer='\ePtmux;\e\e]52;c;'.buffer.'\x07\e\x5c'
  silent exe "!echo -ne ".shellescape(buffer)." > ".shellescape(g:tty)
endfunction
