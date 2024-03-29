scriptencoding utf-8

let s:middot='·'
let s:raquo='»'
let s:small_l='ℓ'

" Override default `foldtext()`, which produces something like:
"
"   +---  2 lines: source $HOME/.vim/pack/bundle/opt/vim-pathogen/autoload/pathogen.vim--------------------------------
"
" Instead returning:
"
"   »··[2ℓ]··: source $HOME/.vim/pack/bundle/opt/vim-pathogen/autoload/pathogen.vim···································
"
function! settings#foldtext() abort
  let l:lines='[' . (v:foldend - v:foldstart + 1) . s:small_l . ']'
  let l:first=substitute(getline(v:foldstart), '\v *', '', '')
  let l:dashes=substitute(v:folddashes, '-', s:middot, 'g')
  return s:raquo . s:middot . s:middot . l:lines . l:dashes . ': ' . l:first
endfunction

function! settings#forw_word_no_next_line()
    let l:line_before = line(".")
    let l:save_cursor = getpos(".")
    execute "normal! w"
    let l:line_after = line(".")
    if l:line_after != l:line_before
      call setpos('.', l:save_cursor)
    endif
endfunction

function! settings#back_word_no_prev_line()
    let l:line_before = line(".")
    let l:save_cursor = getpos(".")
    execute "normal! b"
    let l:line_after = line(".")
    if l:line_after != l:line_before
      call setpos('.', l:save_cursor)
    endif
endfunction
