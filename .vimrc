set nocompatible
syntax on
filetype plugin indent on
set clipboard=unnamedplus
let mapleader=" "


set nu
set cursorline
set noswapfile
set autoindent
set expandtab
set tabstop=2
set shiftwidth=2


" Vertical movement for wrapped lines. Switches off linewise mode.
nmap j gj
nmap k gk

" Home and End movements via Ctrl+a and Ctrl+e
"nmap <C-a> ^
"nmap <C-e> $
"imap <C-a> <C-c>I
"imap <C-e> <C-c>A
" PageUp and PageDn movements via Ctrl+j and Ctrl+k
nmap <C-j> <C-d>
nmap <C-k> <C-u>
"Scoll without cursor moving
"map <C-J> jzz
"map <C-K> kzz

" Map ctrl-movement keys to window switching
"map <C-k> <C-w><Up>
"map <C-j> <C-w><Down>
"map <C-l> <C-w><Right>
"map <C-h> <C-w><Left>

" Command line emacs style shortcuts
"cnoremap <C-a>  <Home>
"cnoremap <C-e>  <End>
"cnoremap <C-b>  <Left>
"cnoremap <C-f>  <Right>
"cnoremap <C-d>  <Delete>
"cnoremap <M-b>  <S-Left>
"cnoremap <M-f>  <S-Right>
"cnoremap <M-d>  <S-Right><Delete>
"cnoremap <Esc>b <S-Left>
"cnoremap <Esc>f <S-Right>
"cnoremap <Esc>d <S-Right><Delete>

" Paste with autoindent
nnoremap p p=`]`
nnoremap <S-p> <S-p>=`]`
" Select all and Copy 
nnoremap <C-y> :%y<CR>


" Search highlighting redefinition
" Use Ctrl+l to swith off highlighting of highlighted text
function <SID>HLSearch()
	let cursorOnLastSearchWord=( @/ == '\<'.expand("<cword>").'\>')
	let searchNewWord = '*N'

	if cursorOnLastSearchWord
		if &hls
			set nohls
		else
			set hls
		endif
		return ":echo ''\r"
	else
		set hls
		return searchNewWord
	endif
endfunction
nnoremap <silent> <expr> <leader>* <SID>HLSearch()
nnoremap <silent> <expr> <leader>8 <SID>HLSearch()
" Search selected text
vnorem // y/<c-r>"<cr>
vnorem * y/<c-r>"<cr>
vnorem <Leader>/ y/<c-r>"<cr>
" Search and replace selected text
vmap <Leader>r "sy:%s/<C-R>=substitute(@s,"\n",'\\n','g')<CR>/
vmap /r "sy:%s/<C-R>=substitute(@s,"\n",'\\n','g')<CR>/

autocmd FileType coffee set tabstop=2 | set shiftwidth=2 | set expandtab| set softtabstop=2| set list
set listchars=tab:\|.,trail:.

autocmd FileType gt-script set tabstop=2 | set shiftwidth=2 | set expandtab| set softtabstop=2| set list
set listchars=tab:\|.,trail:.

"autocmd FileType php set tabstop=1 | set shiftwidth=1 | set expandtab| set softtabstop=2| set list
autocmd FileType php set tabstop=2 | set shiftwidth=2 
"| set list
"set listchars=tab:\|.,trail:.

" Add new line below in Insert mode
imap <C-o> <esc>o
imap <S-o> <esc><S-o>

" Stop moving cursor back with Escape
let CursorColumnI = 0
autocmd InsertEnter * let CursorColumnI = col('.')
autocmd CursorMovedI * let CursorColumnI = col('.')
autocmd InsertLeave * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif"

" Russian keyboard layous support
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
highlight lCursor guifg=NONE guibg=Cyan
set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯ;ABCDEFGHIJKLMNOPQRSTUVWXYZ,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz



" Use CTRL-S for saving, also in Insert mode
noremap <C-S> :update<CR>
vnoremap <C-S> <C-C>:update<CR>
inoremap <C-S> <Esc>:update<CR>
" Quit from vim
noremap <C-Q> :q<CR>
inoremap <C-Q> <C-O>:q<CR>
" Close curent buffer
noremap <silent> <Leader>q :bd<CR>
" Run OS shell
noremap <C-C> :sh<CR>

" Compile *.coffee files on Save
autocmd BufWritePost *.coffee silent make! -b -m


" Switch spell checker on and off
nmap <Leader>s :setlocal spell! spelllang=ru_ru,en_us<CR>

" Обворачиваем текущее слово в двойные/одинарные кавычки
nmap <Leader>w viwc"<c-r>""<esc>
nmap <Leader>v viwc'<c-r>"'<esc>
" Обворачиваем выделение в двойные/одинарные кавычки
vmap <Leader>w c"<c-r>""<esc>
vmap <Leader>v c'<c-r>"'<esc>

" Выделение блока по отступу
function! SelectIndent ()
  let temp_var=indent(line("."))
  while indent(line(".")-1) >= temp_var
    exe "normal k"
  endwhile
  exe "normal V"
  while indent(line(".")+1) >= temp_var
    exe "normal j"
  endwhile
endfun
nmap <Leader>i :call SelectIndent()<CR>
" Для выделения блока по отступу так же есть плагин vim-indent-object
" Если он установлен, выделение блока — vii или vai или vaI

" Save current view settings on a per-window, per-buffer basis.
function! AutoSaveWinView()
    if !exists("w:SavedBufView")
        let w:SavedBufView = {}
    endif
    let w:SavedBufView[bufnr("%")] = winsaveview()
endfunction
" Restore current view settings.
function! AutoRestoreWinView()
    let buf = bufnr("%")
    if exists("w:SavedBufView") && has_key(w:SavedBufView, buf)
        let v = winsaveview()
        let atStartOfFile = v.lnum == 1 && v.col == 0
        if atStartOfFile && !&diff
            call winrestview(w:SavedBufView[buf])
        endif
        unlet w:SavedBufView[buf]
    else
      " First time buffer open — restore last edit (vim run) cursor position
      silent! normal! g`"zv
    endif
endfunction
" When switching buffers, preserve window view.
if v:version >= 700
    autocmd BufLeave * call AutoSaveWinView()
    autocmd BufEnter * call AutoRestoreWinView()
    " Remember last edit cursor position
		set viminfo='10,\"100,:20,%,n~/.viminfo'
endif

