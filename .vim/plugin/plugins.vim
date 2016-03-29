call plug#begin()
Plug 'kien/ctrlp.vim'
Plug 'Raimondi/delimitMate'
Plug 'wookiehangover/jshint.vim'
Plug 'Shougo/neocomplete.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'alunny/pegjs-vim'
Plug 'powerman/vim-plugin-ruscmd'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'altercation/vim-colors-solarized'
Plug 'kchmck/vim-coffee-script'
Plug 'michaeljsmith/vim-indent-object'
Plug 'tpope/vim-sensible'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""
""""""  Plugins options setting   """""""""
"""""""""""""""""""""""""""""""""""""""""""
if &term!="xterm"
  syntax enable
  set background=dark
  set t_Co=16
  "set t_Co=256
  let g:solarized_termcolors=16
  "let g:solarized_termcolors=256
  colorscheme solarized
endif

"vim-airline show buffers on window top
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1


" autoclosing pairs. "<:>" removed
let delimitMate_matchpairs = "(:),[:],{:}"
" Toggle comments by pressing cc while in normal mode
map cc <leader>c<space>
" Cyrillic 'сс' :)
map сс <leader>c<space>
map <leader>/ <leader>c<space>

" Autocomplition plugin 'neocomplete'
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_insert_char_pre = 1

" Snippets Plugin
" Trigger configuration. Do not use <tab> if you use
" https://github.com/Valloric/YouCompleteMe.>
let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsListSnippets="<c-tab>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" CtrlP key maps
noremap <C-B> :CtrlPBuffer<CR>
inoremap <C-B> <Esc>:update<CR> :CtrlPBuffer<CR>
" CtrlP options
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed'
let g:ctrlp_regexp = 1
let g:ctrlp_custom_ignore = {
      \ 'dir':  '\v[\/]\.(git|hg|svn)$',
      \ 'file': '\v\.(exe|so|dll)$',
      \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
      \ }

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'

  " ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
endif

" use jshint
let g:syntastic_javascript_checkers = ['jshint']

" show any linting errors immediately
let g:syntastic_check_on_open = 1

autocmd FileType javascript UltiSnipsAddFiletypes javascript-jsdoc
