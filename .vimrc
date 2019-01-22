" VIM (Linux) startup config

" Run pathogen on startup
execute pathogen#infect()

" Close buffer if only NerdTree remains open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Customizing look and behaviour
set ignorecase
set smartcase
set guifont=Courier\ New
set splitright
set ruler
set autoindent
set smartindent
set laststatus=2
set cscopeprg=cscope
colorscheme elflord

set tabstop=4
set expandtab
set shiftwidth=4
syntax on
set backspace=indent,eol,start
autocmd VimEnter,WinEnter,BufEnter,BufRead *.c,*.h match Error /\%80v.\+/
autocmd VimEnter,WinEnter * call matchadd("Error", "\\s\\+$")

" Filtype specific rules
autocmd FileType make setlocal noexpandtab
autocmd Filetype gitcommit setlocal spell textwidth=72

hi Error guibg=purple

" Custom commands
command CleanLineEndings %s/\s\+$//e

" Mapping hotkeys
map <F2> :NERDTreeToggle <CR>
map <F5>a :cs find a <cword><CR>
map <F5>g :cs find g <cword><CR>
map <F5>s :cs find s <cword><CR>
map <F5>c :cs find c <cword><CR>
map <F5>t :cs find t <cword><CR>
map <F5>d :cs find d <cword><CR>
map <F6> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <C-F6> :let temp="tab stag ".expand('<cword>')<CR>:exec temp<CR>
map <F9> :cscope kill 0 <CR> :silent !cscope -Rb <CR> :cs add . <CR>
map <C-F9> :silent !ctags -R <CR>
map <F11> :set number! <CR>
map <F12> :set hls! <CR>
map <S-LeftMouse> <LeftMouse><S-*>
map T :tabnew<CR>
inoremap {<CR>  {<CR>}<Esc>O
nnoremap <C-J> <C-]>

fun! ToggleCC()
  if &cc == ''
    set cc=80
  else
    set cc=
  endif
endfun

nnoremap <F3> :call ToggleCC()<CR>
