" prevent tcomment from making a zillion mappings (we just want the operator).
let g:tcomment_mapleader1=''
let g:tcomment_mapleader2=''
let g:tcomment_mapleader_comment_anyway=''
let g:tcomment_textobject_inlinecomment=''
let g:tcomment_mapleader_uncomment_anyway=''

" markdown
let g:markdown_fenced_languages = ['c\(\[.*\]\)\?=c', 'html', 'python', 'cpp', 'go', 'rust', '\(ba\)\?sh\(\[.*\]\)\?=sh', 'js\(\[.*\]\)\?=javascript']
let g:markdown_folding = 1

" which-key
let g:which_key_timeout = 100
let g:which_key_display_names = {'<CR>': '', '<TAB>': '', ' ': 'SPC'}
let g:which_key_sep = '→'
let g:which_key_use_floating_win = 0
let g:which_key_max_size = 0

" tabline
let g:buftabline_numbers    = get(g:, 'buftabline_numbers',    0)
let g:buftabline_indicators = get(g:, 'buftabline_indicators', 0)
let g:buftabline_separators = get(g:, 'buftabline_separators', 0)
let g:buftabline_show       = get(g:, 'buftabline_show',       2)
let g:buftabline_plug_max   = get(g:, 'buftabline_plug_max',  10)

