"{{{ Plugins configuration file
source ~/.vim/myplugins.vim
"}}}
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
set laststatus=2
" Hilighting colors of errors - White symbols on Red background
hi SpellBad ctermfg=White ctermbg=Red guifg=White guibg=Red


autocmd FileType coffee set tabstop=2 | set shiftwidth=2 | set expandtab| set softtabstop=2| set list
set listchars=tab:\|.,trail:.

autocmd FileType gt-script set tabstop=2 | set shiftwidth=2 | set expandtab| set softtabstop=2| set list
set listchars=tab:\|.,trail:.

"autocmd FileType php set tabstop=1 | set shiftwidth=1 | set expandtab| set softtabstop=2| set list
autocmd FileType php set tabstop=2 | set shiftwidth=2 
"| set list
"set listchars=tab:\|.,trail:.


" Stop moving cursor back with Escape
"let CursorColumnI = 0
"autocmd InsertEnter * let CursorColumnI = col('.')
"autocmd CursorMovedI * let CursorColumnI = col('.')
"autocmd InsertLeave * if col('.') != CursorColumnI | call cursor(0, col('.')+1) | endif"

" Compile *.coffee files on Save
autocmd BufWritePost *.coffee silent make! -b -m

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
"{{{ Key mappings file
source ~/.vim/myshortcuts.vim
"}}}
