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

" Toggle comments by pressing cc while in normal mode
nmap cc <leader>c<space>
vmap cc <leader>c<space>
" Cyrillic 'сс' :)
nmap сс <leader>c<space>
vmap cc <leader>c<space>
nmap <leader>/ <leader>c<space>

" Select all text
nmap <C-a> ggVG

" Vertical movement for wrapped lines. Switches off linewise mode.
nmap j gj
nmap k gk

" PageUp and PageDn movements via Ctrl+j and Ctrl+k
nmap <C-j> <C-d>
nmap <C-k> <C-u>

" Paste with autoindent
"nnoremap p p==
"nnoremap <S-p> <S-p>==

" Search highlighting redefinition
" Use Ctrl+l toif !exists("*ReloadConfigs") swith off highlighting of highlighted text
function! <SID>HLSearch()
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
vmap <C-h> "sy:%s/<C-R>=substitute(@s,"\n",'\\n','g')<CR>/
" Search and replace text under cursor
nmap <C-h> :%s/<C-R>=expand("<cword>")<CR>/
imap <C-h> <Esc>:%s/<C-R>=expand("<cword>")<CR>/
" Search text under cursor
nmap <C-f> /<C-R>=expand("<cword>")<CR><CR>
imap <C-f> <Esc>/<C-R>=expand("<cword>")<CR><CR>
" Search inside selected text
vmap <C-f> <Esc>/\%V


" Add new line below in Insert mode
imap <C-o> <esc>o

" Switch spell checker on and off
nmap <Leader>s :setlocal spell! spelllang=ru_ru,en_us<CR>

" Обворачиваем текущее слово в двойные/одинарные кавычки
nmap <Leader>w viwc"<c-r>""<esc>
nmap <Leader>v viwc'<c-r>"'<esc>
" Обворачиваем выделение в двойные/одинарные кавычки
vmap <Leader>w c"<c-r>""<esc>
vmap <Leader>v c'<c-r>"'<esc>

" Переход к первой локации/ошибке
nmap <leader>1 :lfirst<CR>
" Переход к следующей локации. Используется для перехода к следующей ошибке
nmap <leader>n :lnext<CR>
nmap <C-Down> :lnext<CR>
imap <C-Down> <Esc>:lnext<CR>
" Переход к предыдущей локации. Используется для перехода к предыдущей ошибке
nmap <leader>p :lprevious<CR>
nmap <C-Up> :lprevious<CR>
imap <C-Up> <Esc>:lprevious<CR>

" Fzf shortcuts
nmap <leader>f :FzfAg<space><C-R>=expand("<cword>")<CR><CR>
nmap <leader>F :FzfAg<space><C-R>=expand("<cword>")<CR>
nmap <leader>ot :call MyBTags()<CR>
nmap <leader>ob :call MyBuffers()<CR>
nmap <leader>of :call MyFiles()<CR>

" CtrlP key maps
nmap <C-B> :CtrlPBuffer<CR>
nmap <leader>b :CtrlPBuffer<CR>
imap <C-B> <Esc>:update<CR> :CtrlPBuffer<CR>

" Home and End movements via Ctrl+a and Ctrl+e
"nmap <C-a> ^
"nmap <C-e> $
"imap <C-a> <C-c>I
"imap <C-e> <C-c>A
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

