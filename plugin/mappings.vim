" Basic
nmap     <silent>         go          :silent! !xdg-open <cfile><CR>
nnoremap <silent>        <m-h>        :vert resize -5<CR>
nnoremap <silent>        <m-i>        :vert resize +5<CR>
nnoremap <silent>        <m-n>        :resize -5<CR>
nnoremap <silent>        <m-e>        :resize +5<CR>
cnoremap                 <c-a>        <Home>
cnoremap                 <c-e>         <End>
cnoremap                 <F6>         <Right>
cnoremap                 <c-o>        <Left>
cnoremap                 <c-d>        <Del>
inoremap                 <c-a>        <Home>
inoremap                 <c-e>         <End>
inoremap                 <F6>         <Right>
inoremap                 <c-o>        <Left>
inoremap                 <c-d>        <Del>
" Map semicolon to colon
map                     ;             :
" Do not autojump to next result when searching with *
nnoremap                *             :keepj norm! mp*`p<cr>
xnoremap                *             ymp:keepj norm! /\V<C-r>=escape(@",'/\')<cr><C-v><C-m>`p<cr>
" Better visual indenting
vnoremap                <             <gv
vnoremap                >             >gv
" fast navigation
nnoremap <silent>       -             :Ex<cr>
" don't jump to next line automatically when press w
nnoremap <silent>       f             :call settings#forw_word_no_next_line()<cr>
nnoremap <silent>       w             :call settings#back_word_no_prev_line()<cr>
" If {count} > 5, j/k(n/e in colemak) motion should be added to jumplist
noremap <expr>          p             (v:count > 5 ? "m'" . v:count : '') . 'k'
noremap <expr>          n             (v:count > 5 ? "m'" . v:count : '') . 'j'
" Better visual line moving
vnoremap <silent>       N             :m '>+1<CR>gv=gv
vnoremap <silent>       P             :m '<-2<CR>gv=gv
" Colemak fix
nnoremap                N             J
noremap                 k             p
noremap                 K             P
" Bring back n key functionality meanwhile disable n/N motion being added to jumplist
nnoremap <silent>       <C-n>         :keepj norm! n<cr>
nnoremap <silent>       <C-p>         :keepj norm! N<cr>
nnoremap                <F4>          <C-e>
" Undo/Redo/Repeat last {cmd, macro}
nnoremap <silent>       u             :silent norm! u<cr>
nnoremap <silent>       <C-r>         @:
nnoremap <silent><expr> <CR>          empty(&buftype) ? '@@' : '<CR>'
" Disable F1 key and EX mode
map                     <F1>          <Nop>
imap                    <F1>          <Nop>
nnoremap                Q             <Nop>
" Yank to end of line
noremap                 Y             y$
" Map <C-i> to <F6> in terminal emulator, it will solove <TAB> and <C-i> hijack
nnoremap                <F6>          <C-i>
nnoremap                <Tab>         <C-^>
" Use arrow key navigating quickfix buffer
nnoremap <silent>       <Up>          :cprevious<CR>
nnoremap <silent>       <Down>        :cnext<CR>
" gf will always edit a file
nmap                    gf            :e <c-r>=expand('<cfile>')<cr><cr>
" TextObj: `ia`, `aa` for inside/around angle bracket.(save <shift> for `<`)
omap                    aa            a<
xmap                    aa            a<
omap                    ia            i<
xmap                    ia            i<
" TextObj: `ic`, `ac` for inside/around curly braces.(save <shift> for `{`)
omap                    ac            a{
xmap                    ac            a{
omap                    ic            i{
xmap                    ic            i{

let mapleader = ' '
let g:wkm = {}
let g:wkm['<Tab>'] = [ 'za',                                         '"#" buffer' ]
let g:wkm[' ']   = [ ':Files',                                       'find files' ]
let g:wkm[';']   = [ ':call whichkey#fix("comment")',                'comment' ]
let g:wkm['/']   = [ ':Commands',                                    'commands' ]
let g:wkm["i"]   = [ ':bnext',                                       'next buffer' ]
let g:wkm['o']   = [ ':bprevious',                                   'prev buffer' ]
let g:wkm['q']   = [ ':call whichkey#fix("quit")',                   'close buffer']
let g:wkm['u']   = [ ':redo',                                        'undo tree' ]
let g:wkm['w']   = [ ':silent! w',                                   'save' ]
let g:wkm['x']   = [ ':silent! x',                                   'save & close' ]
let g:wkm['1']   = [ '<Plug>BufTabLine.Go(1)',                       'BufTab1' ]
let g:wkm['2']   = [ '<Plug>BufTabLine.Go(2)',                       'BufTab2' ]
let g:wkm['3']   = [ '<Plug>BufTabLine.Go(3)',                       'BufTab3' ]
let g:wkm['4']   = [ '<Plug>BufTabLine.Go(4)',                       'BufTab4' ]
let g:wkm['5']   = [ '<Plug>BufTabLine.Go(5)',                       'BufTab5' ]

let g:wkm.a = {} | let g:wkm.a['name'] = '+actions'
let g:wkm.a['c'] = [ ':let @/=""',                                   'clear highlight' ]
let g:wkm.a['d'] = [ ':windo diffthis',                              'diff' ]
let g:wkm.a['D'] = [ ':diffoff',                                     'diffoff' ]
let g:wkm.a['p'] = [ ':call whichkey#fix("regpaste")',               'paste from register']
let g:wkm.a['r'] = [ ':call whichkey#fix("replaceword")',            'replace cursor word' ]
let g:wkm.a['s'] = [ ':call whichkey#fix("regsend")',                'send to register']

let g:wkm.e = {} | let g:wkm.e['name'] = '+edit'
let g:wkm.e['d'] = [ ':call whichkey#fix("delete")',                 'delete current file' ]
let g:wkm.e['e'] = [ ':e',                                           'refresh']
let g:wkm.e['n'] = [ ':call whichkey#fix("newfile")',                'edit newfile' ]

let g:wkm.s = {} | let g:wkm.s['name'] = '+toggle'
let g:wkm.s['n'] = [ ':set nu!',                                     'line numbers']
let g:wkm.s['N'] = [ ':set relativenumber!',                         'relative line nums']
let g:wkm.s['q'] = [ ':copen',                                       'quickfix']
let g:wkm.s['t'] = [ ':call whichkey#fix("toggletab")',              'toggle tab']

nnoremap <silent> <leader> :silent <c-u> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>
call which_key#register('<Space>', "g:wkm")

autocmd! FileType which_key
autocmd  FileType which_key set laststatus=0 noruler | autocmd BufLeave <buffer> set noruler laststatus=2

" this line is just a hotfix for whichkey timeout; track https://github.com/liuchengxu/vim-which-key/issues/158
nnoremap <silent> <leader>zz :echo ''<cr>
